import SeismogramViz from './SeismogramViz';
import EarthquakeViz from './EarthquakeViz';
import './DataVizSection.css';

const DataVizSection = () => {
  return (
    <section id="data-viz" className="data-viz-section">
      <div className="section-header">
        <h2 className="section-title">Research Data Visualization</h2>
        <p className="section-subtitle hud-label">Empirical Evidence & Model Performance</p>
      </div>

      <div className="data-main">
        <SeismogramViz />
      </div>
      
      <div className="data-viz-container">
        <EarthquakeViz />
      </div>

      <div className="data-grid">
        {/* Decorative Metric Cards (Static representations of the Astro versions) */}
        <div className="data-card glass-card">
          <div className="card-hud hud-label">STATION: UGM01 | REAL-TIME</div>
          <h3>P-Wave Detection Accuracy</h3>
          <div className="viz-container seismogram-viz">
            <svg viewBox="0 0 400 150" className="seismogram-svg">
              <path d="M0,75 L40,75 L50,60 L60,90 L70,40 L80,110 L90,20 L100,130 L110,75 L150,75 L160,50 L170,100 L180,30 L190,120 L200,75 L400,75" fill="none" stroke="var(--color-text-muted)" strokeWidth="1.5" opacity="0.5"></path>
              <line x1="90" y1="0" x2="90" y2="150" stroke="var(--color-accent)" strokeWidth="2" strokeDasharray="4,2"></line>
              <text x="95" y="20" fill="var(--color-accent)" fontSize="10" fontFamily="var(--font-heading)">P-ARRIVAL DETECTED</text>
            </svg>
          </div>
          <div className="card-footer">
            <span className="metric">ACCURACY: <span className="highlight">94.2%</span></span>
          </div>
        </div>

        <div className="data-card glass-card">
          <div className="card-hud hud-label">MODEL: ENSEMBLE ML | N=52</div>
          <h3>Magnitude Estimation (Mpd)</h3>
          <div className="viz-container scatter-viz">
            <svg viewBox="0 0 200 150" className="scatter-svg">
              <line x1="20" y1="130" x2="180" y2="20" stroke="var(--color-accent)" strokeWidth="2" opacity="0.6"></line>
              <circle cx="40" cy="115" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <circle cx="60" cy="100" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <circle cx="85" cy="85" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <circle cx="110" cy="70" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <circle cx="140" cy="45" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <circle cx="160" cy="35" r="3" fill="var(--color-accent)" opacity="0.4"></circle>
              <text x="20" y="145" fill="var(--color-text-muted)" fontSize="8">Observed</text>
              <text x="5" y="20" fill="var(--color-text-muted)" fontSize="8" transform="rotate(-90 5,20)">Predicted</text>
            </svg>
          </div>
          <div className="card-footer">
            <span className="metric">MAE: <span className="highlight">0.42</span> | R²: 0.89</span>
          </div>
        </div>

        <div className="data-card glass-card">
          <div className="card-hud hud-label">REGION: CENTRAL & EAST JAVA</div>
          <h3>Seismic Network (BMKG)</h3>
          <div className="viz-container map-viz">
            <svg viewBox="0 0 200 120" className="map-svg">
              <path d="M10,60 Q50,50 100,70 T190,60" fill="none" stroke="var(--color-text-muted)" strokeWidth="1" opacity="0.3"></path>
              <circle cx="40" cy="55" r="2" fill="var(--color-accent)" className="station-glow"></circle>
              <circle cx="70" cy="65" r="2" fill="var(--color-accent)" className="station-glow"></circle>
              <circle cx="100" cy="75" r="2" fill="var(--color-accent)" className="station-glow"></circle>
              <circle cx="130" cy="60" r="2" fill="var(--color-accent)" className="station-glow"></circle>
              <circle cx="160" cy="50" r="2" fill="var(--color-accent)" className="station-glow"></circle>
            </svg>
          </div>
          <div className="card-footer">
            <span className="metric">STATIONS: <span className="highlight">58 ACTIVE</span></span>
          </div>
        </div>
      </div>
    </section>
  );
};

export default DataVizSection;
