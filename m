Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59441FFC59
	for <phone-devel@vger.kernel.org>; Tue, 10 Feb 2026 02:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688904; cv=none; b=SqHH1hepyn0x40GjqGEGf8ClZdpAl8Y9I/U9f2rEf/o1WqzEHJ6d/r4XpSwyhYXoHmU5IgLNVmNiEChx73qE4k3gu9TJFxQui55jvywtU4fDQz6OqFciZFV/CCyUKFPckvCmo5gR53BpVINqLlAe8QPOXfJbUO96TOESTRPGIDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688904; c=relaxed/simple;
	bh=0o8U2gcjTNQ4vDr6UZXp78OySADKbF17k1AkPUv068U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rs5AcXpzU3aS5JXZaKxRhuLLQYdVxK03DiElxuGRfFQIa9rWXCn8Z8++Rz0wpvJbyL4xdwLa6HjYGFyoO1pEJwggCJvibgnFySUQOGwHSV3wmwRdXM920whgWCEUuoMcAqGkCQ1HV/qXz40iQCzItEzY34uL1fiPwDM115fDpu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LhBItlgr; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LhBItlgr"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8c531473fdcso515629785a.3
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 18:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770688902; x=1771293702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8V9j+WcUBTGuq4+DLWgdunD0gzm+6gbTsWVxuBpzJo8=;
        b=LhBItlgrBTYcfBEQMHViBXVMJnAQlBcg9zFlmmx6qczBayq8LNer6o1lStM7JDLiOs
         GEk/b0XvfZzcoJJulnuFm/2skncCQoSstCQfgwwtQvTplFdSUnE5harfLv1JKQbpxz7S
         vraZED4pUnqN9bYqIilM0Gq2yDoD4cFZ0m7b9xO28StW+9bIekhDzgXpHExi/uJOr6Cq
         hzUqo+9I96cGM3N61apzGTHXfDNKhtS1pMYnYKTHfDXamZtC75WOcNwVGScmQfD0fzdg
         1W3YR4V9WGlw+dyHi539oQIRLuTJ3pp+xFB+afKuZ3Rt+vDNiDqvpVeCb1V00ZFXuzdB
         iqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770688902; x=1771293702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8V9j+WcUBTGuq4+DLWgdunD0gzm+6gbTsWVxuBpzJo8=;
        b=b4DUcpc6CxXRF1gn3MoqpNHMnrfZ/yvDxKugt9NhDD/bsLcrbxm4sprquXCuiNlyuj
         ibHw52EBCEW8oCvGagypuEv4y3JfsaEdUoryHmB+In0HwieSrBpZduEuFF6cdLaYCF5j
         tXgWIfFLQfb82hWnFxgS0u59muO28htRgLIqHK9ZeeRWYjMeWdQTZ9vyo5jUgbneJSGG
         Fw/QE8XkU5wN9N/qZXmspU4jlIGVC7YKsQ+qnY0pSXFANfjqHHKInumKed361X+0N0Pj
         gamHad+niVlm7772V6V5DuzLGuZHdwsW4NhQcvMKgmlhD9ZRxIyBfZU++sBOT1YNFYT7
         FzJw==
X-Forwarded-Encrypted: i=1; AJvYcCVVMrydtJuCYkQqgNAhfgjNEzJg8wIFBOVJ2vS+xRV0lDf6EBXti0cedbH+ypZbZ8T+/U+HNpWEOEpbrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKrq5Wx83AE5vS6M0SwqoaFLqRi4r7g7cqGknVZFZM0KTiB0OR
	7zczoDcqN3wkeL14m3lbt41IMffmq193L7pSm7wY2Tuhdo2GCS3SJUFc
X-Gm-Gg: AZuq6aI/qIGktxXwpt7r66KcJR/VD8TTlpUeTqayyoNZ8cLfhSzEkxXR8F4wroGsJPh
	DazrmuUG76fHso79dDX/rXulZqnsdHvEngHrEwuUdpXQRbpzLJBv5cDPtw/dnt463eBjzJvxEko
	ypaopLi26HbWtkpnu2RwraoaFom3IFC8/Rf3onfRBozAoyPLk5jy0JAlDWXG715vzm5y5d9/zvR
	53UhsdDBCYgEaMcTs0DWt2V+eB0OrO3H+tx72s5PtHW9TwY9Ie4QNJiSRZFtXhTz2P3zwDBNbBd
	7F39W4DeWIEpPlZCrafyAGRproQY0OXGbsWh/Xr+MrvqpJSMacPmXfINBppJJ9mY+rpNp5IVC6/
	6AV5ZbMSiVaLd+07YEm0vdiv6zOpoLw7U0hmt7zzQvVaetN556td0SEO2U5Os6DkNFa38xVcmIr
	JVALumxBpuWMjZ0nwtLBrifcbVLb0leijAEifk0i8XxwzwsQJpIg624I0HnYbObwEEdg+9FHH1b
	+CUydAo7F+T0xo=
X-Received: by 2002:a05:620a:3942:b0:8c7:17ea:7dd7 with SMTP id af79cd13be357-8caf13ffaa5mr1659349985a.69.1770688901997;
        Mon, 09 Feb 2026 18:01:41 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8953bf5b2e8sm89171196d6.23.2026.02.09.18.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:41 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Mon,  9 Feb 2026 21:02:04 -0500
Message-ID: <20260210020207.10246-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since dcf6fb89e6f7 ("media: qcom: camss:
remove a check for unavailable CAMSS endpoint") was applied, probing all
endpoint nodes and requiring them to have a remote. There is no sensible
remote in the SoC devicetree because camera sensors are board-specific.

The ports are meant to be extended by a board devicetree in order to
define fully configured endpoints and connect the ports to camera
sensors. For nodes that are only meaningful if extended, labels are
usually assigned. Label these ports so they can be extended directly.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index b8a8dcbdfbe3..3eb4eaf7b8d7 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1776,28 +1776,16 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
+				camss_port0: port@0 {
 					reg = <0>;
-
-					camss_endpoint0: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@1 {
+				camss_port1: port@1 {
 					reg = <1>;
-
-					camss_endpoint1: endpoint {
-						status = "disabled";
-					};
 				};
 
-				port@2 {
+				camss_port2: port@2 {
 					reg = <2>;
-
-					camss_endpoint2: endpoint {
-						status = "disabled";
-					};
 				};
 			};
 		};
-- 
2.53.0

