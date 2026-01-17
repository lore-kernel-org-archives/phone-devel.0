Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B0F30BF69
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 04:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622810; cv=none; b=giztyxsDbRjQEt5LEA/9nzcR8WU+D41KXwUQrrMmTJcaPQVmRTr7maL25/uIfhjI8gShxyoFewsK7rAOBGfDMzbKdonK+VhRVVL53TL00IXBLqaiUHu+KvnUqVNd0NE/ZjA7q3ONFh3N7Cc89KcLykE7c9OXbaa8rzUH5NMRVtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622810; c=relaxed/simple;
	bh=qdzZ4n+LNV/PsoK+uJu2XlZkWbAHoGmAnFcee+ROIho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVB7uysX4wklr00DSohrc7fXutuKlV8j5epJebLHRjtBesgBWagygF73ps/g2AoZvPLv+Sksx67jpecV74EiHo17GKwMHx6Agh3lqgXTWpJnCDmUnWSjcgPSHX13NcOnncbkJSbcOa/sOHQveFgPZRLVTGsCaI8wjiSJtBoGhnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aj/T3tJI; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aj/T3tJI"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-88a2f2e5445so33330386d6.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 20:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622808; x=1769227608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=Aj/T3tJIVfjqHAgjMCmWBpypr6/63+EAPxUK5+Vb0/sfCwElVsZXqZDdIm2Xc3dY+u
         ztS9zYsGvt89gL/i5qs+HrDEus+igkRiLU9tCYGC6Jq1/ICCFNrBpXn1+2sbT179Dwdz
         R3eUGMZnlWCJ9DyFdMPSjZTBkLrruLui8aHr2eKK2F3gK/CAvQPGGL8zDxt68xQ4rwat
         KX9rdZaDnkRMUtuDOJFeghkeyt9LDkND601DsHGJtKWRMKXKYkqkj56tgOWTBUr/hqbd
         Cd1o14nfFSXNSXKSOl7xZ4HH3gjIniiBKSurs1sQS9hP9Zd+4ZqBhCWrKkoV+a3TXayr
         AZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622808; x=1769227608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ahSJ784Agrct7hUV5mLfOvTi+Ib0YPHnSuXQC3QM7fc=;
        b=XL2qn1csZ2DvhyfnApUGMh1f2rWcg0kkd+O1NyBJhkCIzDCPTcHbKKZ9xJsA5bkcwR
         jxosjYFG9uYJsJ8EZ6doDzCCdSa1ujfRwbrteNvqy6r07gMdVCzRkZmFdh/W3+/UsDSZ
         rpwaGZwUujyGzMRzi0ZkQO1TD0gI9zbmD3XOzZEFy8nZAN6MRKxdtx4EGn0isjcWBb60
         OAotNiAPI9eKMHIPxjbgT4j5sGsIZh1Xk8j7VxFchzGSUAlyg2UuLE37MWao/DVxD7R1
         eBpaGvCI8yXI0Bf0YoH6pfoIzWGo19CinhkwT81ECCCAYW7ByNwjtcG2NWjd0YM0+yZ9
         lmFA==
X-Forwarded-Encrypted: i=1; AJvYcCW8p1lS8mVGLRqKj0vnNEaCLXN++KKf1AVbluhgkKEj9OMnoU+Oyh/w2rto0UvYDZLFPZf6gVWSb6pcIg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgzab0oDGiOUVtZ3eV41yKLQL1/8Go63Y7hW+7YarFi58Ycjin
	KPrFr2PPD31RMMMI+kjYnBVvXO0nfv9pcitNZllkdJT/+d56yCXPj3CN
X-Gm-Gg: AY/fxX6M40dlktA6soJwfpqbDfwSVH5VySLcL6Ts8jICJU4zHZXq5CuWrGq0Wv8heZW
	FpZJtWr6tXJEo3yshdqPMVQFb73eGLc88oHUzax1FMKdFFG3qXbpyRnosAEBjzFJ04J7XDNk7zc
	/hjumXcAeGNavBQe5ptgfBJB78LVd9GVYl3SmMiV5f3n+p6uDYaUeWxWdD71HXen6UH/LFpXGXy
	uL/a2EeSzsOYBAFdGobamuPDvp2WnXI9t+3F+vpbTnbmIsguXGrMtL+K3+KZPd4DEXsBDfM2mfV
	MB1oH8rMEhI3qBXMuwnvC8J5diJsGecgOPUOdN39njUcKGAm2Bi8kt1ww8w5YTsTxfLARGi3Kz7
	bQdHFy2cTArWPEn/MUy/1nc+ddmCm82wQYuS/Aqfo75A/7Gqp/rQKudU/9JZrmwydMbcohhrFq2
	557BLjDWLWUmDIZW3Tj3sdXzauLPwuSpjeGvnb0Wq4//8zJeQmA7XK+uUJeEmQoUOS1oWlzE5vL
	as=
X-Received: by 2002:ad4:5dcb:0:b0:886:3be3:9e5d with SMTP id 6a1803df08f44-8942e2f7434mr76298886d6.16.1768622807837;
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6cd63esm36994196d6.49.2026.01.16.20.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:47 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v7 4/5] arm64: dts: qcom: sdm670: add camera mclk pins
Date: Fri, 16 Jan 2026 23:06:56 -0500
Message-ID: <20260117040657.27043-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117040657.27043-1-mailingradian@gmail.com>
References: <20260117040657.27043-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The camera subsystem is added for the SoC common devicetree, but the
mclk pins should also be common across the SoC. Add the mclk pins for
the cameras.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://lore.kernel.org/r/5135823c-f2e4-4873-9e3a-9d190cac0113@oss.qualcomm.com
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: David Heidelberg <david@ixit.cz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index 3eb4eaf7b8d7..f21e60a6a2ef 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1196,6 +1196,34 @@ tlmm: pinctrl@3400000 {
 			gpio-ranges = <&tlmm 0 0 151>;
 			wakeup-parent = <&pdc>;
 
+			cam_mclk0_default: cam-mclk0-default-state {
+				pins = "gpio13";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio14";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk2_default: cam-mclk2-default-state {
+				pins = "gpio15";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam_mclk3_default: cam-mclk3-default-state {
+				pins = "gpio16";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_default: cci0-default-state {
 				pins = "gpio17", "gpio18";
 				function = "cci_i2c";
-- 
2.52.0

