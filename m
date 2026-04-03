Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E793C9ECC
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228440; cv=none; b=lH96sOGjGX2CLw5R/AmrDych1+I3VVwuySsjuWGskOQ/jveNnQlPX3H9HB+fOy6MrQ8LWl1aRxJK6658q0wTCu/DFJgMykKP9PkcOdvSsdmYb/ENrFpxCCMAMjxsKocEvI4H+NVTciGHnjMmEMkjCu5DywVNLJP5UBnr55lVjPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228440; c=relaxed/simple;
	bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TtQby6qWqwqmtJ9B1qtTDhbUafBU8SVrRMsDPb/sKAEGR6llRLPwRT9Gv6eoKUjB4VQJr/ums9z4LCovalwQ4/rr27bPI+/zX0GlWB7K/dsLTOlfNmBdwciuwXREpgoEADuN/bQKn+HIMBB5d20S+2Bn3/QmKdgS/6j3Au2sH54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IaqiGgtn; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IaqiGgtn"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66dd1b5bb6aso3421718a12.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228437; x=1775833237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=IaqiGgtnD57PD+EZwhTfwVxBsgIdHnI0Hq5hMakuxQzFuGOCuC0YCqgIy+GEHW27IB
         CLTB8dQBlFdzKfsihtllMSkkYV6nwIC23/yR+Wyt54veEYYvMQbyrqAxUvJXUHVb5oIj
         Vb80w4D0C32pW1AYDiN5fg/XVMecKy+3wKvhECw9OiCpRQ5uDC4+0WXziKXd2QtrtFbp
         o0T8wFrLmNp+LKjXXqhiEuJBNEtsZrCN+ICRDRLzN7o/YxTm2IiivX5XNWuhIDN9CpXj
         rO89Ve1jN9WrHJZpjQqiUOp/uO6RViSrha2UAWofPN62883Sjg/YIdX4Bt56+5JYJGB7
         KIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228437; x=1775833237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7gu4S8y7arrlye5B2e+gfyyz199/jWDrWD1f/lej6PM=;
        b=g/M4lv6bxKc3dOmjl+DF3OfLKkqhAwJ4cdxA2KGOGsZJmW5Zke+KqQXHamdDNVXLUM
         zZIr0bVOPBYIXLcL/ZlNY/L2Zg8GsyJKMMinq+3eNA2OpD3KpwmOpXVlIOeTUhB/nMOb
         AmqyrnCNBo5+C7suva3yK+ViY5IHbOFz3td+NLKIs2hQDjvX/eabOVktrphxTQwAVh6F
         MHH4dOyv2m9i2l2fADQ2Ly8DsxuMstwvFgzpF7suy/pc3GJ6CjcPGWfOCR5XtBW43cbb
         UTt8qliNhNIK8CpZ8+xaBiTb8R942BoErfLU5+l4UF/sZruMzSqBiGpJOAsqEQ9k0b1u
         NPkw==
X-Forwarded-Encrypted: i=1; AJvYcCWuT3oybmr020sc1628EtCFlFKSDxYXShGQQ1h0NHg0CV3IgnIl4u1BrJIuAVkl3Xjw6Hzcm2YH+sqMcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJmv2S4+JHMjx5jaEBclDwLbrqfY2cwd7drasSxPRXl7fFrS/p
	B+PnRcYCRizMs0ERktSb2g2Bhl++YybSq/90REcyiJbOPhSX6+aqlns0xvMY+iCSW1+d+mQBh0r
	NOSQuQXU=
X-Gm-Gg: AeBDietvMeaZoez17oTsjbya52jCjYZGtTG0sdOP7ErH6vyFOpvQO1B/MabPh6yyThs
	2U0f/2a7x7b1EACy7h/lX7YVlIQA2NN7y3EwvaYrSXitq11YZKzDJNSiXF8TrrGwZDkuHBVNVxo
	vvGm/Dh/5Nee54TZEKmpzGyruamvAvt8Q41JT55VMGaJ+kd+4F9LzB23U/DhasqSPd0JDQpm2PU
	3f4r2nfbFt6VClwvII/EgurKdMHaV0BuehbwEdy1N8yL4fQUtlBcnOX6vJHMAYJsRDwtjwfqgGv
	eU2QVaLKKyBFrf/x9g8O3zK4O0kIRhbCsNdRVGH6MxK6HvTWPaogagGCL5+LCehTC96owYRB7in
	Nkil6d2WTLnDrLm6iVW479WNpNYIYm564Y94+2KBihezkcN05XzzNTuBiS5ApmL4X30TixQnGfk
	28FSkVqihon+XGDab31nOVxYmg9cTHIp7pq8ZYFpIABz6XLYK1L1FqXAhCMCMboXVDFPdNGokhq
	F57r1WryqnV+bwd/6Uh9GWLZTZVy+Mz/SVu4Q==
X-Received: by 2002:a17:907:c819:b0:b9c:5357:15e1 with SMTP id a640c23a62f3a-b9c679a5e68mr178381466b.38.1775228437171;
        Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:24 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: milos: Add IMEM node
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-2-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=1119;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=TQbe/biy9htlzVQhWhB2WMPTK2E7zpG9vrUxoUGpEvE=;
 b=wtds/FesU61DwOgHwI2IZtmUWUdtpEuRWDzS9r/ek2UT/3mzDGVqZwNz+x12BgknKrrzIUS5u
 PFjJEXku1ERAo1kOHDG2e6tY2RmIyv/Bvk5C0tdY22r67Uh34eoFDlx
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the IMEM found on Milos, which contains pil-reloc-info
and the modem tables for IPA, among others.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..1c045743ef77 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -2289,6 +2289,25 @@ scl-pins {
 			};
 		};
 
+		sram@14680000 {
+			compatible = "qcom,milos-imem", "syscon", "simple-mfd";
+			reg = <0x0 0x14680000 0x0 0x2c000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0 0 0x14680000 0x2c000>;
+
+			pil-reloc@94c {
+				compatible = "qcom,pil-reloc-info";
+				reg = <0x94c 0xc8>;
+			};
+
+			ipa_modem_tables: modem-tables@3000 {
+				reg = <0x3000 0x2000>;
+			};
+		};
+
 		apps_smmu: iommu@15000000 {
 			compatible = "qcom,milos-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;

-- 
2.53.0

