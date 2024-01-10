Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9302D4BAA0
	for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 15:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="it+DHZrv"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5587655bbfbso456400a12.3
        for <phone-devel@vger.kernel.org>; Wed, 10 Jan 2024 07:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1704899657; x=1705504457; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8SieuMzS9DY3Pq9rPlup7/9ZFoFKz0B/pmDiOQsHEqI=;
        b=it+DHZrvdiYS4KhFY35+ZNPhhteyoUoUJVav3AoO7iuDv95w2HVE0s9NNAVT77PtCJ
         vHuJVj20ocCUb/H6D6qBktjZVVUFz+z7SB+fILUkdHMfdYo2rfQyuuyWtJlgvlP7hRBQ
         OXoypi5lAGbt3IFReJj6wWHfGd3cC10u4gZrZlL07TSbUSMyg4Kw2Xof3YvuI+XjfD7f
         zQPUZq+Q5Bn56fOBj2TJazI6i/AvTPhqWogWqu7M5AgwbsLVVGZ8ish62f0FVfjBaE0Q
         J4Q78BWU2Y0oF9s7Zd2lFiw9CCi/4GGA7NGfr+iPm5hfjapClHr8r5iA8FFJ23sgsb5N
         uLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704899657; x=1705504457;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SieuMzS9DY3Pq9rPlup7/9ZFoFKz0B/pmDiOQsHEqI=;
        b=NRxqDq5QeV7DIhI/s8YUQoGI99V1aaQZDhss0jDdmnGzxWpeO+CElrF6dZ8j/cRZcC
         t1xZhw2nm7WSEmDm/ml47SrWlnynqr2v97PxjTCdL5EgMgzCErPhUnZ6Vss2WwtrJfQ5
         dYvtkx5hgniboNJud0VvhOspeAjJBVpM6+hcXv6E8U78Cct2kJ6hvv9ilxsagFkSQX6X
         dnF63JdHcyudaouL/EBxiKWeVY6VYcu4B6TxABWHJzCl8LOmracL6fN2FgebeYS6Qqwa
         Z2FXueOydbgiKaNq/38gfvTe7iqTi4e4t/FT0A+BC9Zd9BPe8HFUrIqKG5q0BVgUCuXL
         oDZg==
X-Gm-Message-State: AOJu0YxbZ2ZNWWRXKo30kh3dEKArrv/PC64EyEUQ69+qr3u/kUZ/VeOW
	1dHOma64JK9PWgC98y4wWt77Zck3SRhbCw==
X-Google-Smtp-Source: AGHT+IH+JVoLAsdIeBSP0v7Ta68ZvOe71Gvt3z5QTKw+y+MKcspk7OUyJ0XvP7JECETBN5UybvP+hg==
X-Received: by 2002:a17:906:6d59:b0:a26:b37d:bab4 with SMTP id a25-20020a1709066d5900b00a26b37dbab4mr484522ejt.171.1704899656621;
        Wed, 10 Jan 2024 07:14:16 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id jx22-20020a170906ca5600b00a27a25afaf2sm2174517ejb.98.2024.01.10.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 07:14:16 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/4] Add display support for Fairphone 4
Date: Wed, 10 Jan 2024 16:14:07 +0100
Message-Id: <20240110-fp4-panel-v2-0-8ad11174f65b@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD+0nmUC/23MQQ7CIBCF4as0sxYDWKpx5T1MFwMOMokCAdNoG
 u4udu3yf3n5VqhUmCqchxUKLVw5xR56N4ALGO8k+NYbtNSjVNIIn0eRMdJDGIkWT+YwoUTo/1z
 I83uzrnPvwPWVymejF/Vb/ymLElIo9BatM0Yfp4tHLjmkSHuXnjC31r5TdxQppgAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Andy Gross <agross@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4

Introduce the bindings and panel driver for the DJN LCD panel using
HX83112A driver IC.

Then we can add the panel to the device dts and also enable the GPU.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Driver:
  - Drop "bool prepared" from driver (Dmitry)
  - Use drm_connector_helper_get_modes_fixed (Dmitry)
  - Use dev_err_probe in error path (Dmitry)
  - Fix width/height variables (myself)
- Dts:
  - Don't drop simple-framebuffer (Konrad)
  - Drop disablement of gmu in dtsi (Konrad)
  - Set zap shader path (myself)
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240105-fp4-panel-v1-0-1afbabc55276@fairphone.com

---
Luca Weiss (4):
      dt-bindings: display: panel: Add Himax HX83112A
      drm/panel: Add driver for DJN HX83112A LCD panel
      arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU

 .../bindings/display/panel/himax,hx83112a.yaml     |  75 +++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  53 ++++
 drivers/gpu/drm/panel/Kconfig                      |  10 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-himax-hx83112a.c       | 352 +++++++++++++++++++++
 6 files changed, 492 insertions(+), 3 deletions(-)
---
base-commit: c03393f04b540b66d267a402fcc9ac2d3733b9e3
change-id: 20240105-fp4-panel-50aba8536a0a

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

