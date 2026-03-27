Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF03A346763
	for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 16:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627957; cv=none; b=DIEuVbmHYf5jFss8ibw0JFT46h2zbDYYgJ1e2JOWyOR2yQ2vUcQt3HecexZq0m3YnzwgkNSuD1tHXHSvopRpiro2xJ6fnUEccVefvdtS9H0intTWQIDfLnyAokPZ6+NMoSjuKctxZY7qRopkcdG6VfNWL/5LP9dCyQ+z4rvDgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627957; c=relaxed/simple;
	bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HAcoPXTaMIjOpExZdniNlLEs0Bhnu228Q7lhYv1VUVUcMxID+bKnNlFc8fD6qT2FxtfH05dCXTtvVWy0YcAthh8Uo98xcaL6hzlo23FZiSh3QkselM0kpphklldavqUjPqgMR1IoHzn/64lHTDKisB3V69WnpptgB4TNErdFAZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=I0olmsWo; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="I0olmsWo"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66b32fd9f26so1023925a12.0
        for <phone-devel@vger.kernel.org>; Fri, 27 Mar 2026 09:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627953; x=1775232753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=I0olmsWoxpRstCu65hD6A96pnIQoLAgUICUYl8cPWFFInW84P1BbJvpl1MPxPnt7+u
         BexgOiQ36XOJaG7smjtrD6hJeMs1sb5NhOBukp0eAld1Kjq3upW7kc66eSKzvulg3wRk
         tgcXvCsb0PPuPntDyzPazArt68HGJuMG/jrC2KBVj2R4y5EhdZLB6pt+eW5NniEMCCQt
         4a5fCjVF9iCAR/MSCS9RGjO4vV49iJVPrULDuXrHl3bGb3lUaFB5w5nZxVLGGrVH7LlP
         qatvBxzPb3LF6R/td1zw3/hJ9Uacu7ISidcxi/3jQjBt+kizPQxFefjb7V6jGrjDeMsC
         kfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627953; x=1775232753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMi8pPc1nu1OwZY0Xf/EDRaYl50oxCMJcLrOAypEPLo=;
        b=cmnS2Ukb5OZhuMw/cm8R/eeZvJ5hJ6Y6XuXE3IJ17y6k6Co8o/Ha8jlIph0n/lhbFy
         mlGpwdZwfNioFt3bXJZoeIwitA0GniwWTJAqVOxtA5TB/7VdOjrvnmOaCMB5+QU685E2
         0H1YHJ12EJlw3OUKmsXM2pHdfxerwuLbLvgB0iXCAhGRa5KncuzGK1H64eiWPDdAQHL7
         sWKx20PnDlZ570qzYpki+2wfRUN+D1d8LYT9JjCIMIXqM3ki+8KrCMkhRcOJJJel6Tfx
         1H5dPwaOrWig+SwJdkUdPXttDkkCfN5FrHotf6p0XAKHSx56+8Xbnn0wLnQc0OUU1N4P
         5Iig==
X-Forwarded-Encrypted: i=1; AJvYcCVrAJL+4nujMBoaf2/q0CvkGqGRvu7/rEWp7zujTBxUir1kmk/SkgzOQT0R1zSEuVISd8pTtJrKSkq3Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLUmFY3nrk6+xJZ9kZWc0wKuTcV6L51AKa6EWvglVmw6W7FDt7
	wB5Ik0YLwX/ZH9j0g+qvIZS/5L/pu8IDJ3QmUPBqWINhW9U4b3efB2cjuKOwGV4DjX8=
X-Gm-Gg: ATEYQzwjbRtPDo766PnxufAehISqkHxcWSXxbIv9X3P3sOa0xskUZ8FOSoDQs3YJ0nS
	UTC9RdKfuwaAu75kmdYw3F/TUkjHEM/J+MKNP/uRIajRnEvzFgcSuI8M+mj73lOaYm0kN3qLmhC
	9Q0/J0TTe7ikoAVc8OJdOpVjGeZWZ6h7srxEWPrtCZetJt8P12rWh2su8V8zy/qOSx0er3d6NJd
	P1Bqr93gcllJIa7TAyk7faByA5kdrYphpA/83v0fvjiPz8oY6sJnFOiCTmnADGcPDRZBEqOOB1F
	4Sh4aHawCKQOPKd+N0xWpVLF/a4FrJWacy2EZnOaX5N/0BuM8VSkBBDzQtX0X+5QlC444nx6oJy
	cbROBkRBAdxSxZbAAAMsh9l560tm+fe75BfQhltG1Sjqj3NhOfqRFC9kBm0/4Hr+fsU+/XyyqST
	0kN13UAnVzYTLMOvLA1T/cLLIpbblXCFXopkvKLtUKwECdprdOgSglVbNJzpnUvXLeX40gqZMhI
	ggaKQ==
X-Received: by 2002:a17:907:1c0d:b0:b88:58e5:86ff with SMTP id a640c23a62f3a-b9b51647766mr196269266b.0.1774627952962;
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:32 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:21 +0100
Subject: [PATCH v2 2/9] dt-bindings: display: msm-dsi-controller-main:
 document the Milos DSI Controller
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-2-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=1141;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=/iuE8Of7PxtUN21ThxuyRVaZpwkJ5NvVO+YKGCgqQ64=;
 b=kINHrIcgMlj9z546raEXwcP6A0Lzrq1gQjA0FLzEM+5Rx5oXlRJ2E4maAJbpBS6QhgEJ6hZFp
 rLOVKD1c/CuAO+zU1Y1Cz+Jhso56+ar/zysDEdXku742owa567YKbMK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the DSI Controller on the Milos Platform.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index a24fcb914418..dbc0613e427e 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - qcom,apq8064-dsi-ctrl
               - qcom,kaanapali-dsi-ctrl
+              - qcom,milos-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -339,6 +340,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,milos-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,sa8775p-dsi-ctrl
               - qcom,sar2130p-dsi-ctrl

-- 
2.53.0

