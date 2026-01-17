Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D82EDD78
	for <phone-devel@vger.kernel.org>; Sat, 17 Jan 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768622808; cv=none; b=LORy8RTcevGHwBoxgv/f6BWRg/+qUTe3UWanvFOj44GKqUof+jF/3favVev0P7PQsZCIz1hj9n6c5nLUs8ivFR8bqnraU2UbeArlsxfxkOVgOkOVJBZ1sV1i0jg4LO7NkWTkMk+qk/TO5PlSR1ci0hwz8xyVBFMag+OImv/1HtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768622808; c=relaxed/simple;
	bh=DLYTLurhJa/dsUPjZdKrouNuDeRcN2aGY2f/dIS8jn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oWbTZwk/470ZnGmjjJfpzH6rEGJ9btyw2SYW6U2d/RUKtmY8W1j0jCWsDpjse5/DgpbdXzT3qncFHGdOWuMjC5jpxOmDxAVC3/0iHatyfQhr2QvYYBXGuRfsyy3HjG9vmIrnADgWXIeO0bHE2VrOqWVNN54op3TA6BhOKoo+wY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=igKi+hxP; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="igKi+hxP"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88888d80590so39673796d6.3
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 20:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768622806; x=1769227606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqibFg67h3gtAqqjjlrzNhRlOJB4sCD3HtefP226Fgc=;
        b=igKi+hxPM9Zg2tfIg2I4VrZ0u1hW6UKupSJUjpLyO+TpUW8QWCPbchJck8sKAXekbg
         +kzhO/8R8vOMzjL5W38rCN0G1HQldV8alZSIoUAwgKt68tLXuTfNVaVRmca8sqpFJTgW
         vi0XmoLAWY+5je3np1sTFn3iyEsy2BWOSvolnDN+hJS8UX1b6Sa40dEjHPjiKZxaTjZ+
         iloTm2TXPa7IIMbi1LP2z6jTBXJ200sXKYlYb0mRs5V0micHWeJ4CryD5EUu41oV7Fly
         211ttRk/89iEJxlofynrOSogcBDc3PkPXGbMhF1U97gnun7vmFHLtE/7Uw/qylOpnf5K
         AVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768622806; x=1769227606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WqibFg67h3gtAqqjjlrzNhRlOJB4sCD3HtefP226Fgc=;
        b=Y4Cwys3r/2hmjWL/O+1VNvXIV+9HrCqan8+gNCPu4/77LXfe8Cb2CqdxysIidaimOE
         HqV7MQg+8QmlEQIKjZkMTr8pDP+HnbPzKlP1e3R0Un58mHD0QCgtTNhyDPSwenBv1tOJ
         JWEGH+K3aQiFVTfsfnd6IFlKx4gyyc8NSOjegbPHzV/UEb9hP8ZOisfqSefhbgcm5FlD
         BkxqVbWAZur5Y5QRbNJpv+Ry3/FWS4vRGlIVbGB491LrdgUQTJZqKOo1TnMP3rp4ZyEf
         umk12UBtXs5b9/paTFt26J6wlr6SHMqb+fam2sLt2nxgw8UbEIRJaGo3Phv607w/RMCx
         bH8g==
X-Forwarded-Encrypted: i=1; AJvYcCUVNWE+SjnMC9KfM4mY7UkDf6L6BZbjmS10/qbqrrMkLRG4g4B5Vw+4LEb7xqOy5RJWgKskDuwmStYsCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXmu+Q+AuRMIb6vxqz8EYoAb2LPwNdfZM0nsoqcyPjuoLCoLMQ
	mph1AO6Gnh2OlyEWBa2vOiB0WaTmELPXsbyL9QLcuj8YXjgIOc+4y/dV
X-Gm-Gg: AY/fxX7BtDexMXplAPjaW7JsJ76rP/fHmdjQ2lLx95JtAPuqQwuXHfVbdrG8KV7vJUm
	iAJ2IlqOUywylNNgIr8fiNGhyOoKUjGFdUuhSEjrNUtij+yCGBAH7sHoXz5aMwRPB2NhC6rxs77
	xGcA4QQNFv19gQCdzt1CscnrEeMQqhFd1HQ3QguXuXoYiJBDfWEmGiUqykEL0UYJCe7PlhCnPb7
	t49fxp5sBfXLWf4g4s8YkL4m3YaKp8Ys6GwRy8d3uJ8x87D0HjeHiR+zCRKqpGn09VGpoBgIMEM
	z3c0owDgCX9atLnWzsgIIRdBq3MJqJYIrnvAp04DNxo8eOwDp2nIhNo1uVnYmyHXTKzD14Yz9SX
	oEGyKMkjgk1uW6rkgC3v1/q+fcE4xOR52THzeApDM2c2LPngZyFEE4+PDXOa+zsGuhJ7jNOnZ3D
	ttlouRPV5Tqr8LeCOR9YCemL/SPxxU+CFxSO3nlkcE48g9oZY2v3Bs3f7nsrBj4xNvU6idXnDJg
	22c0CMfP3VfTw==
X-Received: by 2002:ad4:5aae:0:b0:88a:2c78:d62d with SMTP id 6a1803df08f44-8942e47a66fmr63179296d6.26.1768622805841;
        Fri, 16 Jan 2026 20:06:45 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d6366sm43908776d6.51.2026.01.16.20.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 20:06:45 -0800 (PST)
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
Subject: [PATCH v7 3/5] arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
Date: Fri, 16 Jan 2026 23:06:55 -0500
Message-ID: <20260117040657.27043-4-mailingradian@gmail.com>
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
2.52.0

