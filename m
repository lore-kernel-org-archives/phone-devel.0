Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59A246335
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288092; cv=none; b=Aqbh82PIzCV1dydTZPP2nXUh7prV6xjyR0GBhOrUzUjLyeibFTspSUSnBb8JgGXPWwStM3/GIdD+nZr7CEd+eUBnM3HEVOTZRAciLl6gwiWtLiGdU98MXX7lxE7BclkC73Fhl1oqd3uzB6gdKEk+IN9MODJCMDVa7suJQOcyg3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288092; c=relaxed/simple;
	bh=1v4dPSgOcOuVrr3Qg9J9gEsFMLIU5i68Rq6Ja2quspc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qW+eaKENbq5TqttgMOxHh6rs/703BhKgEmcT9iERvnAV0cLON1sRP2lSdrEf4agAN1+SN9r5Q5rsWNKDi3oEQQpfe4/S6ensOCdj4U9Qr9dEe0I+4WD0Hyf6FoSITf4XsbdVZ+LvCKZOSWqMjKRyFFvCwfNP5p5a/NmgkAqoclg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HAnOt1cK; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HAnOt1cK"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50334dd44d2so44923101cf.1
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288090; x=1771892890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JChrl7P28KUq3wAAIILUlLq1kDzZ9Zu7NIGfFL/Hv8=;
        b=HAnOt1cKRSUStA/otjkj27uKR2JkaSAnza1rI/Nyw+mfuSJiCTwDBz+F0p8bCnPXc7
         VMldhHD7k+QCFDfCFNQ/vwyMldauo+2ZQRnhm9fQfKFuApNy2OLtz8zS7MAaLMXbcRJW
         zcarf/KHZ9qn9l+nsF4xyz1SnaVubHRrbe9sWcdB4kLhoO+H8SmKMXtDiJ2Lg4pLI6ru
         92R+tKjL1iuQVyt1/MsR1LeH+DRk9cU8+soHRuGv4i8Qkkkx1o9uWLWVj5tWB1udOlxj
         kAQkbi4WiXEJGxY4bexBons1IlnNIuxSglfhw23RlcqG/d9ep/OpHH7u8pInfp0Kvlvj
         0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288090; x=1771892890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8JChrl7P28KUq3wAAIILUlLq1kDzZ9Zu7NIGfFL/Hv8=;
        b=DdaWqq5qMIw156bJbMH/mDi93+/tE5DqtC3F84ccmBy005uuI+t+XWcUAEEG0cTI2c
         cmg5NirQePh0OEviAR+0Z9uZFLf36Igerhzgph1o++jACT4xSHHJPszoE6uuIDcERJP5
         HNpg+9xiyfDM9Qf1Z4c56I4aZTMK5ttuzCN0yHw+aoTpaF/TD7q9gUYZHqbNCyHbLMcC
         Z1/X+K+c1dAPKY35A5XAc+JQUxOeRGIZnMZ9KgHi01JALUhyXqnLnLQ9i5k4C67sSeIb
         XAgQaNC2UTtlzalO97VqY4ICMKcao5jipICaWHJf9df9iTII9sCMIvDXPG5j2X2nnD5u
         edgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRqfKwRKwzL4yxQozJ4t0QZWklZEY2s5D400xNxFWLPddIWn6F6Unyq2yxNLrfMbldSixr+S/3rUsVEg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Z6c8eYKXbpMd+cKqqRDCBnVIMuFzpLCkCqzqDBNh6MgAAXwn
	++f/LzLX4BVmVQw7keza3OGgbAyOGCcKe9YBXZ6JuISytzqKdw7gMYjx
X-Gm-Gg: AZuq6aIlnxx0EBJ79YltqaHAFDrkW6TtzPR2L5yA+ZyViOW2YzlDwstAmgp+vIGpiT7
	dsKe2mUsTrsKVR+QFblaSQgQ8lPH5EGD215vHum9rHpSgVWy5Ul9Defy0GLvRBNCH+h7pFso5BE
	5n6spU4Ip3zQUHmTlKf6YLH2FBDQFNtfahN9h8n7pSyHQEKHU7Z5SWxAozRGdPhVHxsPYbCKPYI
	ZELRA1BG8GmxldDEat5IVcj4iDzv2G7eNtBD3Y0p2b1SLJaogZtjEmpmiD+wDqZmg8QicRicFhN
	KYoyNj4B21Rryb38rgnoSoPxXgSp8aAIZy9i/wPq7gVVDmHOClGLcq9QmaDTYXZQgk8CiSnX1Eo
	M/DqiYv6fvEgSaLtqT1jBuk8c6bgWWV+jhq3kYFoorC+RFIIpZWHUtzQSAfyX737LyPqBKUhjxr
	AXu9WQ6uora43s7EvFUkmbdCyw1UYseA==
X-Received: by 2002:a05:622a:1654:b0:4f4:d2c3:b236 with SMTP id d75a77b69052e-506b3fffed1mr139068231cf.47.1771288090458;
        Mon, 16 Feb 2026 16:28:10 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506847d9852sm161636611cf.7.2026.02.16.16.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:28:09 -0800 (PST)
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
Subject: [PATCH v9 5/7] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Mon, 16 Feb 2026 19:27:36 -0500
Message-ID: <20260217002738.133534-6-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Endpoints cannot be pre-defined since commit dcf6fb89e6f7 ("media: qcom:
camss: remove a check for unavailable CAMSS endpoint") was applied,
probing all endpoint nodes and requiring them to have a remote. There is
no sensible remote in the SoC devicetree because camera sensors are
board-specific.

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

