Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F2F277C82
	for <phone-devel@vger.kernel.org>; Wed,  9 Jul 2025 11:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752061612; cv=none; b=AtMB94dxB4LE6Y/ac9VYloLYDr809BwoSzQRDoD0qo5FeTv5Datdp6kcWJYlHUaRBCMfy04D+xiVVR8t2ehTjYn3N5mu7ibAXU5f7ziUEl+hTwixSprM4aq/OAJDYmtVdSvuwWAPSlaxrjURucU62KXqd5BOJREPOtTxDGrDKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752061612; c=relaxed/simple;
	bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kuyuU2++mte+5wtFRPr9ru/NReocTZRCAr9rxVffUf6ULj1TlXW5Jm83WHg4f9BQ+29H0k2K/CNDt2SfjsnEZSDmKy520/gF5CbNyzZoSNNGclThxPyFC0fZcfXAMiIYw44TszHUKocJsdFhXW111Ts9Dnhfenu825s6/vY83L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=R0+awoIw; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="R0+awoIw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-607cf70b00aso10624399a12.2
        for <phone-devel@vger.kernel.org>; Wed, 09 Jul 2025 04:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752061608; x=1752666408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=R0+awoIwfU1tt252Xbern30X2JitnNWYSShuLC2f7O/1OVJ8ZqKGm3y0sDeTZ1/XL2
         GzOQtkaY28GFj8bki5xKF287f6rq2V+1JDVuUq4b+cMxiCHjsqdOWDi0XYsEJuVfGp+9
         KGKHWLRkNzxuUmW1OExQ6Qd6H5PcFVe8XBWNgerjS6Xq44Ikf0XSLc0FYOh5hR3nEoCt
         MAVRBGGXQvcf5IHobXhGI3Cn6lB47ba/hfMKlQCE+E0FoOsJOm5nSNR24dtNfVa1f5MA
         7VODwydLLR/lh5v8rbKy2XtdQ4Pp9S6gU4ZZsTMU4LfzMDjXkArXVUi54Nypzm1LYTxb
         U+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752061608; x=1752666408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAnJzWwXKrGKXfHhShQFByTC4Yn9/Fk4WT3ljFDRPy8=;
        b=OS8FRcawcBbJfHA77KchuqKUoo5AD59aBhnyWEhhB9Crc5X28h4l52Xd2NiPUOtsiu
         V4SQV/c5zmWHT7pqULeChNf62oT06mgH8e2CynMTGakBSx7NXtVUbps/x4jZG6TOY9Bl
         bwNauroybP9vPPjypFPXgjhTLd2W3LVz5oygO1yFgui3KJK0rtKJfU/iUT+s84A779g1
         mMGm9sctdVBCLqgATWjYpu61arMZd2s+OWO4Fcf26yZCa1uIdAV2uHUxbS/2Eg0pkT+N
         bxCEKWDoU23ebZfGwwMaKdmJ8kLE3p4+JBI03SNGlTRIYy9zK3FX4+YLw8j+wBJdLhAm
         UVpA==
X-Forwarded-Encrypted: i=1; AJvYcCXvWefHPD1rqsSSv8A3Tc1AhEMm3K3qTiaCs76C6cA9nvy7N/p6LLn9dXQEiIy4+8UVrfaGxgad8EnegA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwO79pQDEtxPpfwKvb81vhbKK1GGEve9Nm3sM86xKtC6hFVTeVf
	htrECil+L5j4oSXeWtDtxBhyGN1gSCNr5lj56B6qC+EWx1IXvH5YQ6iWjjZELDC/b7A=
X-Gm-Gg: ASbGncs780xr6YuimETQbioUOxTmjxljbOxMlfXWJK0MyRdipDVSZOd1tZRRH+6cyla
	J6JCwcD8qcWQR4FAE94Y3stUtbvZD+14Oog3Grb19LYHh6hFtRLst9UbKs1FTYRnKNrnPsNupiK
	BTNkCqEgfF05ARbocwxLCjW7hu1zzhfRvMslt7uBuIwsou0+rSH0ok5oCmD2n5J7ejEdigqe6Wc
	iHsgrfbfwo5gdY5yi0Yy357Wz/qGdSwjtRmk6xJUNHqvVGK6o1Rwm9A/nDVNVmUWu+ypP8665oh
	mwBSnO8Vm9/5GgVg63q3z2Z/NrjhMVfHHXmyfUg8Q9Bd/WTuJZLdtnou1k6sA9rMcAYJxRGPfAR
	82ur4CUTG0K4gu0rMQzzB7GmdAwa9BEQ8
X-Google-Smtp-Source: AGHT+IEA2gAxDmVGoVvlu0rJ9OiSZz8Anqd/n4DMxrx//OnDKCpXUaD5KAn6BsoH8yK4ZuVKq4o9pg==
X-Received: by 2002:a17:907:3e94:b0:ae0:d94c:f5bc with SMTP id a640c23a62f3a-ae6cf5e23a8mr235455766b.27.1752061607628;
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
Received: from otso.local (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f692e4ecsm1102995266b.55.2025.07.09.04.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 04:46:47 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 09 Jul 2025 13:46:34 +0200
Subject: [PATCH v2 3/5] dt-bindings: pinctrl: qcom,pmic-gpio: Add PM7550
 support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-sm7635-pmxr2230-v2-3-09777dab0a95@fairphone.com>
References: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
In-Reply-To: <20250709-sm7635-pmxr2230-v2-0-09777dab0a95@fairphone.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752061604; l=1214;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ti52fUIMaEUfyXG/r0ucMDBwGqfW2JIhtAFMWMJATNg=;
 b=qtldo2h/MAR7NtTwbnEcZm5YVQMx864QsG2TLcCQpDOVijGGylryftoMwPZtuNmShCkL8P8rp
 VTVRcfBekK6DJ1VgmBr+DE0GRt5F4LllSgl44oQMkd3+bMKUvI2au/0
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
to include the compatible string for the PM7550 PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 055cea5452eb62ab6e251a3a9193d1e5da293ccb..04957fefff0bb72d5dc6d29bfa4d87ffd37ab8d7 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -27,6 +27,7 @@ properties:
           - qcom,pm6450-gpio
           - qcom,pm7250b-gpio
           - qcom,pm7325-gpio
+          - qcom,pm7550-gpio
           - qcom,pm7550ba-gpio
           - qcom,pm8005-gpio
           - qcom,pm8018-gpio
@@ -261,6 +262,7 @@ allOf:
               - qcom,pm660l-gpio
               - qcom,pm6150l-gpio
               - qcom,pm7250b-gpio
+              - qcom,pm7550-gpio
               - qcom,pm8038-gpio
               - qcom,pm8150b-gpio
               - qcom,pm8150l-gpio

-- 
2.50.0

