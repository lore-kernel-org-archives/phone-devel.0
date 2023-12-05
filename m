Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="OaaPf+7a"
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F9E1B1
	for <phone-devel@vger.kernel.org>; Tue,  5 Dec 2023 06:39:08 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c9e9c2989dso47612341fa.0
        for <phone-devel@vger.kernel.org>; Tue, 05 Dec 2023 06:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1701787146; x=1702391946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k136HpPBxB75fbT2utHLBa5irmSPTM0KT5lmOjawCwk=;
        b=OaaPf+7a5PkEk72T9XMz3mlYDzsMysPE87orMB1q3MV1NL4CHgEXwzsLzG1mjZ63+G
         tuhrTJHGj1edHvYfpPXirFqjzvhNCUkbOjXpdY/2Ja6yuc82a3PqbifF4+xLqE6rXrQL
         lumJGH3wUPBNRMlyb8BubIFhPrPVseSqwHYKAAGAj4dU0s/qWU34CmgiYJZx3DTLwApY
         p/6ZEG/ahALM+RCwEz+gKisc3ssMmuDq+JoWP4OONJfN/yJ0h1cC6IK7KNaDenJsZ4sq
         sbgu/zI6tOArabP7+mm+ab1KfL61ff6Qi3Rr6EkZcaAzVETQ0fIvDlmOv2ZL8ksgHVeM
         ey4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701787146; x=1702391946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k136HpPBxB75fbT2utHLBa5irmSPTM0KT5lmOjawCwk=;
        b=Te75KOQxQ8jyryiF3TiN0qRQ8iIeRIVsEx/ev6+JnigpDeQ4JhuddlrCeHUDEL29dg
         jYJlUSZHDBEFiCnj9ZxZq0jxJ5UFEXbsE01apWNXmhGRLyOSeeULA0gZ2PZP4O9sX6Hh
         zKG6Y7EcM0XF2b4NCjWcAP5141QvRQLeR0pa3g6USmH3oVzYD+xwG/GM/CC5qk6e8Av3
         zF+UvP61G+sh8O7mZ6g5qNGaxNudw+wGMR5BSGLPfiC2jZU+QBj3M9s44d5uH7zwz54o
         vttNkl543lbc45Tc80n9/E4GORolL/0P0eQSRiEzpf6t6buv7qt3uUUFBybfiG6YzVi3
         wBFw==
X-Gm-Message-State: AOJu0YxMJhK37bNnaBPkTo5iVM8jgNGx5XjULXr0pHuDmr1us5QRSuks
	Htw9dxZkMeRMtRt2G8WTQ2Hkxg==
X-Google-Smtp-Source: AGHT+IFOavbHkdRWPb8px1Cr8bPqA7vg84TJz2Nm+49OCmZM3xh5M78lvKEn4tQlhg5HYN4zPm59kA==
X-Received: by 2002:a2e:9094:0:b0:2ca:34d:f80a with SMTP id l20-20020a2e9094000000b002ca034df80amr1683813ljg.64.1701787146223;
        Tue, 05 Dec 2023 06:39:06 -0800 (PST)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id gq18-20020a170906e25200b00a0a8b2b74ddsm6795404ejb.154.2023.12.05.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 06:39:05 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 05 Dec 2023 15:38:54 +0100
Subject: [PATCH v6 1/3] scsi: ufs: qcom: dt-bindings: Add SC7280 compatible
 string
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231205-sc7280-ufs-v6-1-ad6ca7796de7@fairphone.com>
References: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
In-Reply-To: <20231205-sc7280-ufs-v6-0-ad6ca7796de7@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
 Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

From: Nitin Rawat <quic_nitirawa@quicinc.com>

Document the compatible string for the UFS found on SC7280.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
index 2cf3d016db42..10c146424baa 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,msm8996-ufshc
           - qcom,msm8998-ufshc
           - qcom,sa8775p-ufshc
+          - qcom,sc7280-ufshc
           - qcom,sc8280xp-ufshc
           - qcom,sdm845-ufshc
           - qcom,sm6115-ufshc
@@ -118,6 +119,7 @@ allOf:
             enum:
               - qcom,msm8998-ufshc
               - qcom,sa8775p-ufshc
+              - qcom,sc7280-ufshc
               - qcom,sc8280xp-ufshc
               - qcom,sm8250-ufshc
               - qcom,sm8350-ufshc

-- 
2.43.0

