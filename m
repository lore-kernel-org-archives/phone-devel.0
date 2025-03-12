Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A672405F9
	for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 12:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741781117; cv=none; b=AP0ral+zq9iLyC47y89gAO5my1M9oNDja5ihkxEyAEdFFkrKUbOBv0JufpB1fJ/W16qBYs4A1wqK/ynuD9iwH72yvOKzU1YhVy0EzD16IXz92b47mr1Q1L+YgJGhc1ltwXzzzXY7z6p3oIYMdfmGIWAt9VNKEv6N3IfHRsQTFAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741781117; c=relaxed/simple;
	bh=6cX5THqC6SB9r/MQ3znf5AsR5rUbbWbJXTQlgQ/Nqjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2Oo2t2e5ZIrSTqA67+JzyW56Oo4qIkVOCXJTN+orAZiHbGxnMYwq/NHVCCLqoD4FvCYYOx917MFg+thPR2xXFelNV4+34+ZyMQ1qXkZaKbYBFQFNzSFKUNZRaLyUrYXSjeAhiXtEmIeE8zF3+OnfY1PkGc1Y/m5WmX9zzSOmtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=jUEYxV89; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="jUEYxV89"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so18140265e9.1
        for <phone-devel@vger.kernel.org>; Wed, 12 Mar 2025 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1741781113; x=1742385913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jCeb1ULglGuh9XYKx2CHU6Na6xTURFvEBVoDxNzGMCs=;
        b=jUEYxV89keR7imtJY9IfCWeqsaVyYj00KMLe3E41pEckrOnNGETmtX+/sS1VKQgGOW
         x7Cv+0J8Y0trxcynk2C2HmIKvKwxSKvB7dfQkuay/EkhtamASXGos3go6mQZeK1D09iR
         SmsvtUq2dM8GL4lTKjBcBfaeikdlDIsUpuXlwK7DDMICBIGzxAzmuxQPJSx+X0/ek6qy
         2LbQwrxnhQmHVf9yM+9/Anc4f17x6xz8S3cBeRJ8SHEL1hhorEMrgveCu93e1g2eJWdn
         62oouNVNCGd6QeaJ6B+GRev7jD4umtSga29waY7nSQ1fvoOTgp58zC3EuRvNs/haqDJD
         u7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741781113; x=1742385913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCeb1ULglGuh9XYKx2CHU6Na6xTURFvEBVoDxNzGMCs=;
        b=ZCKAyj/5xekRRQBoQxZ6Dol7vjzWqf1gn1ufx4GK+EuH4sHhJ6Jvxr0MfjwnB54IIl
         cG+/IZ48INxIB7suz6rsf6d6Hg3drsaqTKlpSgjbkuvySjEXc3SWEc+FCVY0Ym+QXCt/
         PkFRY2FYZfxsPD3QxmkTQ6gAjq8X+JmlXdgyvRXuclK/e4y/FlNECbJFo1zZYv/eG+iA
         cWUoqEvGpwXs6Dr5pyQAz4BMCcOWRCvmk8+0mh90Wu/tM+x0tbpHz/rMLdLFkCEwhyCA
         5Xqj2t6i1ilyuFdDoBRoWn66obju2feOmkuA7K6nYFdPTPqr6ipojfH52FNoAWsDiPb5
         bGxA==
X-Forwarded-Encrypted: i=1; AJvYcCVjfEnGeBcRBpKaWY48jr8SAJfmQ5IZr3o7nVh2TX2s5VTOtedt484em/xY7H+V7WGJMSz1gogp8KSQQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqIoXHm+sJByodCLjUSfmzQACrLx0FIofqnkSrYqq0dAwKSZcD
	Otv0wFXFXZOPcrw9V1u5eYG8YkVK6fr1t1V6slO6KkeXXn7TUlW5I+gQKr/tMU8=
X-Gm-Gg: ASbGncu5xaZLZX2zMioozJjJSQWtgnzhPcjQYJta3902vVcGgEwTlyj4L/yrRmA/D/m
	gRJyG+druWOxa89YQcwVu15EFvXwE7Ji7V2zcGjYknQxeYKY/aem7MjBs69bXjvfgKQKJiJKQbk
	7z0NEnltCj+jf9T2Tf2zJ+irjlhFfgXr25bpV51YfpBTZRrxg1PcnAGZbYmYEiBrs7UAyssbXA2
	rrTOl/u9lWDzMeVXhoojnXhDBmTgoK2kCXv2GfudIsljEVKtmJxo5NiN6QJmv8mYxoxOzBFvMQ7
	pLBcEujhfjTHEg35wu+oqsSPoiCCM2N4GgeCew708y0nyG3y6C5gHL9BEWZq9ODpHxcnzsrSEsg
	EG0nyr59rTgWoIs9wpQ==
X-Google-Smtp-Source: AGHT+IFI0x1QPiyLI3WY31duJJ6H2f4cFVzC4D17zbYy5/vSinoP4DDZ+b2H7r9wwYkgkoxL/ETrNw==
X-Received: by 2002:a5d:6da8:0:b0:390:e535:8770 with SMTP id ffacd0b85a97d-392640c841amr9041223f8f.14.1741781113576;
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb799fsm20810608f8f.2.2025.03.12.05.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:05:13 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 12 Mar 2025 13:05:09 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: qcm6490-fairphone-fp5: Add
 OCP96011 audio switch
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-fp5-pmic-glink-dp-v2-2-a55927749d77@fairphone.com>
References: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
In-Reply-To: <20250312-fp5-pmic-glink-dp-v2-0-a55927749d77@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2

Add a node for the OCP96011 on the board which is used to handle USB-C
analog audio switch and handles the SBU mux for DisplayPort-over-USB-C.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index ea9f5517e8a083e37c4b7432322bd6d18fea84a5..e0470be9142caa4bac4285a191725bbd60e706fa 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -750,7 +750,19 @@ vreg_l7p: ldo7 {
 	};
 
 	/* Pixelworks @ 26 */
-	/* FSA4480 USB audio switch @ 42 */
+
+	typec-mux@42 {
+		compatible = "ocs,ocp96011", "fcs,fsa4480";
+		reg = <0x42>;
+
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_LEVEL_LOW>;
+
+		vcc-supply = <&vreg_bob>;
+
+		mode-switch;
+		orientation-switch;
+	};
+
 	/* AW86927FCR haptics @ 5a */
 };
 

-- 
2.48.1

