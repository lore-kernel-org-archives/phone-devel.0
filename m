Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2D04C650E
	for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 18:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791828677; cv=none; b=IuFjWOA0uciOz8crNGhwUp991/YqeVW2k19JLjTuIRITiPUM24jz5p9xS4+fDUMYzO9ebucDH+6vpTGl6xIvmTHC/GbLuoWAOcabDjEWbqGiBTk2RFLDYAMSlw2cXuyX2GQNThhA+Msacq22I6I9d0KBkkxnRlOsoTVACbNfzlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791828677; c=relaxed/simple;
	bh=ke74GPjOiVdcLhuz3rtphO6+a7fMHTX5+RkRMzBMbnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qop6H7nbQqnUSu9NWUc4HPVBND7+rcadHBdhjO6xY1KGsoKLLyxAO3XTPlS1pRWmk1N+VKxwdM/ufwFL/2SHca8AeDRmlYsVu7xE7vwvqZthrmVhXBG7lPJ7dQR2YuFxQdYbdekZ/1Je0RdHogm98SQUn9K7WghB9m3SS+lpIdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=v9fHjtOC; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="v9fHjtOC"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c34bff61551so202415466b.2
        for <phone-devel@vger.kernel.org>; Mon, 12 Oct 2026 11:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791828674; x=1792433474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=v9fHjtOChy4q/9OnQ73899fI/4sfIG/BLv7pBMW/RI5vsbLtIqqPCq/T+lmdVlphrw
         CGKKZYEycK/5zuZlbbTiOcqc+6xNwbLsp4VRxxNXpvSSJfS0akjLAHd6nV99mZN/v9O5
         K/8qz3syslxy8Bm99kGmKmS3rHqbASCcAeKRhLYMrdqfsZgfmSziL0uiuevGbAcZb1c9
         VNjqPvJFve0tq0w2v0Z9g7A9Sebna0BHeM7qcOe2zDDSLsNh3PPMyhRphrBvGkylWsrS
         LYeKfWK55sfmgf06pSShB7lqhIvGxrsmYRBVGaZin1F3BGEriCgmomQSWelIsmrDFN8F
         3DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791828674; x=1792433474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+lZKGmObmd47/Y9rOiwVSAJPnc99rNMg+8rnP10wQQ=;
        b=cwESEybzi7PJOaI2dm+Cgjuj68r/Pqw0UAjs3eZHCV9cb4Ew1NhRLJtgHGDjK3Oaop
         sNv6qhufCVTd9Z+TSuEGwmMQTXqI2DOJ0Y3d2Pw0Zo8gc68E1qkvdB6XuEjtyHljCa7Y
         5yXY1bz9nAqXefH4j+dyij9dmO4rKiALnTIfbpX0vxwWSLQLbKSFKXCnn8Pkm7f721n/
         uPu/w0W0QzSOA/2EklRPhN49m6ouzpH97Oe9F17a5XlcjigqGwx65DyWPYqYrMb1rGUM
         X5FuBQ9RoZ+M2OR7Bme7WRBhJxIlIKP7B4S3pYEwANA/Qlm/pLWeCN/gYcRKSMIxAaIS
         JMww==
X-Forwarded-Encrypted: i=1; AKwUvBxV/4KRVu0dZmAzPNvPVJwG1jRd8Y72wL/rywelopBzgyw/Q1635yRzf26l4Ov1+TcpNUxCxucZmjtnEA==@vger.kernel.org
X-Gm-Message-State: AFq9FYI3vHn/atJPIehZbtNs52FKCjg9Fp3fGs/TnZklRpBxC5A23rBl
	8GYFYfA4BwekB848bVS05f6ZnbqQ96kUMGeIaVFhx5btrpYYh2gxBFf0ajqxz+WD3M0=
X-Gm-Gg: AYBFou2C2kn0gwgMxdhVEOzzqR2mj+aNPey30FtjwcFpDP2bttDoK0pOrL+buXAFycF
	Mm2sw83UMdU2MJKoSlCgjhtdkWc46nRM2fvkCNPgtCFLJZ5ZR7SqB+oEI3LUiRPvlg6G3hyTlBh
	0juwGf4Usl2Vl+AyZvFF9LctwLxW0famAZs6oqZPT3xPHjUbrKe4Z+Gk2s8o1jWrCxDeQjHzp/9
	jVY0jg50GACcCwTeXUk39Yqx3KrxUEcIxRDd5cqCsDmt/qxhnR3cUfbsU3HqLD4AH78JUCOGkTe
	PdI0BS5lKR+FCObYtkfnV0ASaFnmCSIwlMfOPzHM6A6Akxx9L2RZYC+Bpveaz6umsN6q5M1Yw6/
	CmZZg2/igDMmQcPVQ1ESk3ZuN5sqMX5h/J2QQEkxmWuwhF8NqJefitdqJqEKiR7PW3UW55kup06
	UjOxbdM7A8hSbHc+iidWjbDp8/VFZ1W3x+cB1N8mhgwbUc0hPLaokLoJ5BSbn1pI6DUe12hv3sL
	xfdQPcuSqKNoegzMCLuXO5qkicz5fJwxVBoOaxeAskHtD9JkNeGvNTDd717wMF0JtzsHjp8B2id
	MTuTsOeRO6drqfM6/SI=
X-Received: by 2002:a17:907:9690:b0:c21:450d:cd88 with SMTP id a640c23a62f3a-c31a9a3361fmr925645566b.6.1791828674339;
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
Received: from [192.168.101.179] (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ac924dsm498415466b.70.2026.10.12.11.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:11:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 12 Oct 2026 20:11:04 +0200
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add Samsung Galaxy Book2 Go
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-book2go-v1-2-7188e7ea7a15@fairphone.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
In-Reply-To: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791828669; l=1131;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=DuXzIQSun3W9jTWkn0omnZ8RlHXkIOkrEU0r1GCIViY=;
 b=oxiEWLGe3H8pzO7bcR/tz+NQOoZwruYk7HCL2vpDG8HwyoDuSCTZdpze9SQqgYW2Wkw1J2FDY
 U1pxGlyB9J1DKCDaaTZsaiNK+mo0vI89+6A63YfyKvYFP379CuXN+2U
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

From: Luca Weiss <luca@lucaweiss.eu>

The Samsung Galaxy Book2 Go is a laptop with a Snapdragon 7c+ Gen 3 SoC
(SC7280).

It appears to exist in three variants:

  NP340XNAA-EXP:
    4GB RAM + 128GB UFS, WiFi-only (NP340XNA-KA1UK)

  NP345XNAA-EXP:
    4GB RAM + 128GB UFS, 5G (NP345XNA-KA1UK)
    8GB RAM + 256GB UFS, 5G (NP345XNA-KA2UK)

The internal code name is Hermes2-14.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..5048e878b7ca 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -887,6 +887,11 @@ properties:
           - const: google,zombie-sku514
           - const: qcom,sc7280
 
+      - items:
+          - enum:
+              - samsung,galaxy-book2-go
+          - const: qcom,sc7280
+
       - items:
           - enum:
               - lenovo,flex-5g

-- 
2.56.0

