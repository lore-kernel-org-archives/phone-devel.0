Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515863;
	b=kXMsblauSHt9lncfRJ4qDfLLeJ3SApbnmW2/Dk9zJcr6QC8v/2OC67LpTfiM7O0HWg8x
	 juml9oearewrM9N6x3yb7hPxGyDml4zkhr8LY0ORU91kdMEwSdAULuY4h5KTCOTBjQWtC
	 OLKGTkQeguHvn672xcYtk/ToAF24m/MLoZyqFwwzx0EuDQWIWhztRGHK9AMfwCQDFVc0B
	 tvEdPlIGI2tfwsj48eZnddPuuk1J7xW6tc8eCPa5GE2wKP/yl6BpxL4+B6J28EHAWTVMC
	 HbqF+cc4UivfF5MaqBTpqfabBm/pa1AF7/gJAgUWeFm62SFg1xY/80fhj4LvKdmTzMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515863;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8sR+zDzMi9HFrsdnqSgy6DAeaNbWllNx84H/JCpIZzw=;
	b=T1CYrkPhExy2sA7okaQJ+rq4Zdv716mrIhUDSxfhjxBCxyQKfgAAwU3TF0od2VNwawkv
	 i4CAkQIDMliKnb2HKmARR//+UxSCBBIZBSeGt9O/cTzQVmJ7jRWmQKZGOPADqpEhJwahh
	 conNCt8W+mfaoEhVPSeVQo6MC5dDppEsnRLj9f1n1Z9CcxP8FFwYFCJQ3L3kn/Ozv13RP
	 XJuqyPfimWDrdFcumkciN5ts/BSUh3DPlOiO2xY9Y7GfC8OgFz+NnwcoDNee6qhQrbLJa
	 LOJzvvJaY6eGKtmAJ1E752Wd26r1nVa3tYqoRdvUn6vuktg5IK++CgAAe7H6+kgij9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6;
	arc=none smtp.remote-ip=95.215.58.119
Received: from mta1.migadu.com (out-119.mta1.migadu.com [95.215.58.119])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5CF606A338
	for <phone-devel@vger.kernel.org>; Tue, 20 Oct 2026 17:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5CF606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=F+6g9+a6
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=h7y1OEuGysqMDVk0RdcCkB7ieMe6BbeWyLj9fbcPZIY=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515860; v=1; x=1793120660;
 b=F+6g9+a62CwMiy7K+Blyc3Im53Bi8PCt8BDwigujfXrnpSgOkNxLC8V9CIbvD9g1D9oLb75T
 tAh71WQMyKnsmaDEf5ZVtPeHmWbJ8l/T259KY0v93f0VdzCs36hpm3Iwla5Q+8TAlrwpS+uEJpW
 cxzHded2KGcPDLaAib3HyFjLq54pLz98GWG31fjUxHWsmMpzV8iiZk9RdGVy+2fgqL2UmLjtaAu
 Me5TrJpebsNDEN37J+chFLXDLse8CHkXhyBhyKGtWoqiHrCoEENBuzeU2GXu65UNsKiifvsPKga
 BIppkm+bIDaOrbDZZs6rXiCuiRxsFyFciQClVbK4mhqoA==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 28b23032f6087e65;
	Tue, 20 Oct 2026 17:04:20 +0000
X-Mizu-Trace-ID: 28b23032f6087e65
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/4] ASoC: dt-bindings: qcom,wcd937x: Add USB-C graph properties
Date: Tue, 20 Oct 2026 14:03:25 -0300
Message-ID: <20261020170341.1641325-2-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This codec can be used with a USB-C SBU mux to support analog headphone
adapters. Describe the mode-switch, orientation-switch and port
properties similarly to wcd939x.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/sound/qcom,wcd937x.yaml   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
index f94203798f24..f15b9a9d90b1 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd937x.yaml
@@ -25,6 +25,21 @@ properties:
           - const: qcom,wcd9375-codec
           - const: qcom,wcd9370-codec
 
+  mode-switch:
+    description: Flag the port as possible handler of altmode switching
+    type: boolean
+
+  orientation-switch:
+    description: Flag the port as possible handler of orientation switching
+    type: boolean
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node to link the WCD937x Codec node to an external USB-C MUX IC for
+      handling altmode muxing and orientation switching to detect and enable
+      Audio Accessory Mode.
+
   vdd-px-supply:
     description: A reference to the 1.8V I/O supply
 
-- 
2.55.0

