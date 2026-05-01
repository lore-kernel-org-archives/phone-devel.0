Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCBC381B1A
	for <phone-devel@vger.kernel.org>; Fri,  1 May 2026 09:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777627140; cv=none; b=p8dnz3JvEgqQ/osXRCOR5Jvb84jY0XWgL5Qc+o/OdYHsab3mseszY1dH4LKUqsFTp3W57KJvXqmS3nFGC8okfKeQwH6BYp+3l7EW3lWHmZjrNQH1WF6BnW9HemuZyyq1cqX5lViFB7prdKVm+AFXZoyEsUEr6Y4xQFPVgve4zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777627140; c=relaxed/simple;
	bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6dIRGeL4eLuv+lt+sidiuvhN5jILjajVY6sBKpkLXLNAcYie9qD1rG/cOhX+nQgaYWY6uR0xTHNdF/ubwIWJNJb5YVFC3l9zA7uofap/pgpW6YcQ7zEXFZ9xa55C/aCPvLd0e46Ok9Ve9BFaFfznVDutMS3zuwotDZVoKrNExc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=UmFMgQ38; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="UmFMgQ38"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-44a786a9a35so321565f8f.3
        for <phone-devel@vger.kernel.org>; Fri, 01 May 2026 02:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777627123; x=1778231923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=UmFMgQ38nVJ/7i+khKEJsxD3GRutbNe3PNGcY5YY/XzZs/AE2Hp9KL50iJ9hPe0S1W
         NlwTiiQ7eYOMW/uRpxKHacoOu8xkBe1f0bur6yjdfIuCUTvEAMcMBXZi2zVathZbyIjc
         qW0GdJPpqhGq5dAGfL5gEh9D5hKTBantio369Yh2ThDrwHpFEzQgLXHfw9nBUKxyu0mD
         cmuNxQVO5CRhaKrxOcjyK8rVzAE2JIowROne/CiskazjT8W9iGu+cP/+rEPBAdsInZkn
         TFfWO8PHzgRYjqxFiLQzYUBw225rZrDdcRu5bR9OOS/tHShTVQhokAkAVzdHNLuAKLv+
         Q6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777627123; x=1778231923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZnuErBRIZTrfkelR+38i2qfJhgtaQ07JLYCEdmx/1ig=;
        b=J1sTB1l1ZyLytC00U2loFLsPSDZUJ0/kbw4PxJ2gLwp0+cjIeA1ckZTiSdG2jNFtU+
         sh/TREmw2H9J+MfrMtQmi5eQ+2NhqxevGbnNrQvo3Dj0nJSHsEvhem7vddM7RoIxjDju
         IcMno3RmlUGWbC0zwhVEsZOtPn6Xa1rsuHKOrqKjjz2WTqZ7X7AFzSFXDzPIUmzPjGqy
         C19NsCKKCUJA2EnDmxIE2ygSRRtRQsIm1bji8gsfEDgHCOM7GbIQWf4e6dEAol1CgQ9x
         9En++urDqnsKDYbVJe1pSKQfENeNjbUFk92HNzeETL8bdUI8H7Gvk2gyQ9Kzn/3nm3CZ
         IlPw==
X-Forwarded-Encrypted: i=1; AFNElJ+TmR+yh39GL0Yyw23zL7bsWzJgFlYYTa2LLvKhP2y0FpZOPBXLBTHyEr7uOUoK5iVqWNSafNQhB6bDRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI0PDnBmBk5TLhKb79Qo3YLLpivFQpPbS76Oa8YFNQ/eUy57p3
	tQIjO3ZRrt0Ugmi8a285JbHNRQTFHScU871GIIplrO5AdlQInmBxyGpNKd4DFPOOees=
X-Gm-Gg: AeBDies2GbPJ8Tkdx+w1LW0L5vYausuwepy2PbKJUK0x4OUSE1WBo+RyYWpxsy75Npm
	rLrQxxJGGyVx8Q0hTmKsj7jIq2vYhh8+MWcW9KbSwYroNjANdVQa+ffMP2+mIqaLzEHgFZp1C/F
	fdWp/ys5SA9aC3xhKvTKT+z77xNnDa889DHDfUr/8R8kId/07348xQBygHBgwZXnL5mCL53YNAi
	pc+xdTmFHCnMJWcBmj3ZxWR1HoM9dvhLw62XKH6k3udDpD8fBmUKgpItVTx1VC4YOF/5JtI4Xwt
	NBlTqRP1cXET5kKV+da8iKCuJWz96XBrsSYqA5PkdoDcjqJ7EKegN/ZDRpRQEXdiqQTBqOlvbcc
	MvwQZe1oQrV6vGbjtYCPy2POmis+YWKJwn3LpKG/b2t2EWnmwC9MXsEIWLYWh1zUo9xfRK6+MPg
	EaRAxBabGPVBqTPfHcJP+T/nFBksaf12Os/TMArqrfDSTwec3FY29KpyV21lM7aq0kQPggHpbXZ
	3ZGGLXL
X-Received: by 2002:a05:6000:22c2:b0:43c:ef4f:79dc with SMTP id ffacd0b85a97d-44a857c070emr3502853f8f.8.1777627123520;
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b76fd0sm3820787f8f.35.2026.05.01.02.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 02:18:43 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 11:18:33 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: milos: Add interconnects to camcc
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-camcc-icc-v2-5-bb83c1256cc3@fairphone.com>
References: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
In-Reply-To: <20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777627112; l=1001;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=XcfJhcCYTkjzBCvg/Cxuww7QqKifGaagi9xIyyI67cY=;
 b=RVgZP6zl4igJW2UZF4EhCIuRsywJ8TJPAYhxRoM9TMx2tC4OgST/C3rBNwMdp80Ll37kF/tYZ
 MYGuDVYg64VBfwf+ZTJzwnsyd0MuFm5A68MD5NmQcV2KBVshRvgGaqL
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The CAMSS_TOP_GDSC inside camcc requires an interconnect path to be
enabled, otherwise the GDSC will be stuck on 'off' and can't be enabled.

Add the interconnect path so that this requirement can be satisfied by
the kernel.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 4a64a98a434b..80208bc33730 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1923,6 +1923,9 @@ camcc: clock-controller@adb0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_CAMERA_AHB_CLK>;
 
+			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

