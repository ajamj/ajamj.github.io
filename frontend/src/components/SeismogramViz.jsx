import { useEffect, useRef } from 'react';
import * as d3 from 'd3';
import './SeismogramViz.css';

const SeismogramViz = () => {
  const containerRef = useRef(null);
  const svgRef = useRef(null);
  const coordDisplayRef = useRef(null);

  useEffect(() => {
    if (!containerRef.current || !svgRef.current) return;

    const container = containerRef.current;
    const svg = d3.select(svgRef.current);

    // Data Generation
    const n = 1000;
    const data = Array.from({ length: n }, (_, i) => {
      const t = i / 100;
      // Synthetic seismic wave: noise + signal
      let amp = (Math.random() - 0.5) * 0.1;
      
      // P-wave arrival at 3.0s
      if (t > 3.0 && t < 3.5) {
        amp += Math.sin((t - 3.0) * 100) * 0.5 * Math.exp(-(t - 3.0) * 5);
      }
      
      // S-wave arrival at 5.5s
      if (t > 5.5) {
        amp += Math.sin((t - 5.5) * 40) * 1.2 * Math.exp(-(t - 5.5) * 1.5);
      }

      return { t, amp };
    });

    const margin = { top: 20, right: 30, bottom: 40, left: 50 };
    
    const render = () => {
      const width = container.clientWidth - margin.left - margin.right;
      const height = container.clientHeight - margin.top - margin.bottom;

      if (width <= 0 || height <= 0) return;

      svg.selectAll('*').remove();

      const g = svg.append('g')
        .attr('transform', `translate(${margin.left},${margin.top})`);

      const x = d3.scaleLinear()
        .domain([0, 10])
        .range([0, width]);

      const y = d3.scaleLinear()
        .domain([-2, 2])
        .range([height, 0]);

      const xAxis = d3.axisBottom(x).ticks(10).tickFormat(d => `${d}s`);
      const yAxis = d3.axisLeft(y).ticks(5);

      const gX = g.append('g')
        .attr('class', 'axis x-axis')
        .attr('transform', `translate(0,${height})`)
        .call(xAxis);

      const gY = g.append('g')
        .attr('class', 'axis y-axis')
        .call(yAxis);

      const line = d3.line()
        .x(d => x(d.t))
        .y(d => y(d.amp))
        .curve(d3.curveMonotoneX);

      const path = g.append('path')
        .datum(data)
        .attr('class', 'wave-line')
        .attr('d', line);

      // Zooming
      const zoom = d3.zoom()
        .scaleExtent([1, 100])
        .extent([[0, 0], [width, height]])
        .on('zoom', (event) => {
          const newX = event.transform.rescaleX(x);
          gX.call(xAxis.scale(newX));
          path.attr('d', line.x(d => newX(d.t)));
        });

      svg.append('rect')
        .attr('class', 'zoom-rect')
        .attr('width', width)
        .attr('height', height)
        .attr('transform', `translate(${margin.left},${margin.top})`)
        .style('fill', 'none')
        .style('pointer-events', 'all')
        .call(zoom);

      // Interaction
      svg.on('mousemove', (event) => {
        const [mx, my] = d3.pointer(event);
        const tx = x.invert(mx - margin.left);
        const ty = y.invert(my - margin.top);
        
        if (coordDisplayRef.current) {
          coordDisplayRef.current.textContent = `TIME: ${tx.toFixed(2)}s | AMP: ${ty.toFixed(4)}`;
        }
      });

      // Cleanup resize listener if needed, but ResizeObserver is better for React
    };

    render();
    window.addEventListener('resize', render);

    return () => {
      window.removeEventListener('resize', render);
    };
  }, []);

  const handleResetZoom = () => {
    const svg = d3.select(svgRef.current);
    // This is tricky without exposing zoom instance, but we can re-select or use a ref for zoom
    // Simplified for now: just trigger a re-render or use d3.zoomTransform(svg.node()).k = 1
    svg.transition().duration(750).call(d3.zoom().transform, d3.zoomIdentity);
  };

  return (
    <div className="viz-wrapper glass-card">
      <div className="viz-header">
        <div className="hud-label">SENSOR: UGM-01-SZ | VELOCITY (M/S)</div>
        <div className="viz-controls">
          <button onClick={handleResetZoom} className="hud-btn">RESET</button>
        </div>
      </div>
      <div ref={containerRef} id="seismogram-container" className="seismogram-container">
        <svg ref={svgRef} id="seismogram-svg"></svg>
      </div>
      <div className="viz-footer hud-label">
        <span ref={coordDisplayRef}>TIME: 0.00s | AMP: 0.0000</span>
      </div>
    </div>
  );
};

export default SeismogramViz;
