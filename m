Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795384116;
	b=WN8/6nc9kfd8WN0Z/XW6OABc17Luq7dLrlJK5UR91l5Ys6jOw1UTOjBs0T6vQFaxHOM3
	 T8toB69Nr0WDPAMd6RnVKRu/ga4mV/jApJAPfTXd5IMJN6i55Fy7SNTm8uU3zbBMr2dIR
	 16R0/C2vtIpZfG++aKw56VNyMFfs/BdflU3M89HIqBJO9MkajQ9IHLAb1KAfQMAJ90Una
	 9yV/CQcFQw9yBWV1K0XM9mgh0wnXTGvlcrmRlsFvqiivICZtv3n4Yln7a5/ny/FAaqLuX
	 hNHSF5pCsim2BRb3G+DB9tua89VVqE0ybzUc30a0xM2eYbIRUbM49+k49Yyu2cxh5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795384116;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=pSLhsIbwZ9ueq868k2rrczxmLa+WaBFggzzt2CaJAhc=;
	b=qSvQlfAmRQiCGeDOMmBvyO/RfeQquDA9ZLfVAfDUNSSMlP2+CIUJRdZ7gv3gPiGvCQ9V
	 A0iVn3Resz0bOF48OCG8J1iP7TpkJC0lgydWYcfgQO+omzkXtkRkYyB4MJSWLS/pv5vyB
	 jsA0MgbczON3J9YnoalDenb2ynJuyWTNNhqXHHwanblbZVbTeFZqPT9A5jVwtJ+CyRpXq
	 PJ/6tTVjiONnwLyvIECKGEF6MH3FM9G0tPPAMRBMIH97qDJvFkDLYg7L2HmfHbpPbQib/
	 kdZeXyGpOkjJivY6Bk9B5a8R9cUpE6kY+kLHmZXcbv5eSZPIMdV+Sn3qR7b8bTamfCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=bzvJA75G;
	arc=none smtp.remote-ip=95.215.58.131
Received: from mta1.migadu.com (out-131.mta1.migadu.com [95.215.58.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398CC606A31D
	for <phone-devel@vger.kernel.org>; Sun, 22 Nov 2026 21:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 398CC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=bzvJA75G
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ehZBvKbSmJsHXqz+5L8veHls/wX4qsWZg42tCt+K6cs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795384113; v=1; x=1795988913;
 b=bzvJA75GcRZudGWFyK6rC5pyVGLIhSgC1V7OAsOvsdsxOGdiK5k7zT0d0HNs1HA7kFTsVzyq
 lWhFV6Hjxo79ecb5AOJmWOqIinjqufG4oWxgompd8o937IevlZpE+w2Rf3Q8xfMH5mXFqQroItD
 zs5hNTO1IPxZae+8Xf5ME9AJC0ZF3HPsDj97j9hufrAdEk0uFPegpMoFvz5OmmxVKjpeU+bHB25
 L3nWy72icCTidvHBpPET2TjMmqm+kh1y1wLZAYQl9XDvaML6oaCm0zU4QNwdWS8SbNiQvlFEOJT
 rpWZfbjEPtkiNQJaqBJeHXHKtKJ+MavQlP6j8V77CNbjw==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id df95091bd50bf055;
	Sun, 22 Nov 2026 21:48:33 +0000
X-Mizu-Trace-ID: df95091bd50bf055
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 22 Nov 2026 14:48:23 -0700
Subject: [PATCH] arm64: dts: qcom: sdm845-lg-judyln: Enable slpi
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-sdm845-lg-judyln-slpi-v1-1-2c77758618c6@postmarketos.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+2ACRokVyku1EztSBolQ0uLe
 PdC3wHeCZOqYoh0ospbTfeCSK4hLI+prMKaEAm+9cE579nSc+h6zitvr/TNhS0fyq6TMM19WOZ
 B0BCOKnf9/N/beF0/rkgQn2cAAAA=
X-Change-ID: 20261122-sdm845-lg-judyln-slpi-14e6ab56cb8e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795384106; l=1710;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=ehZBvKbSmJsHXqz+5L8veHls/wX4qsWZg42tCt+K6cs=;
 b=R2U5ZT1Bt22RnCNetIZh8dMc6uQyLFAm3bfPdEWrixrtK9yMEWbEMdUlTAT6DhYbdTq8QyrvC
 uG1bzGTwCw8ClwQQ28GTDiXI1dHI8kwxnlt/v42W25aiPOezxVHcKNI
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Set status okay for slpi_pas and provide the firmware-name for it.

```
remoteproc remoteproc3: slpi is available
remoteproc remoteproc3: powering up slpi
remoteproc remoteproc3: Booting fw image qcom/sdm845/LG/judyln/slpi.mbn,
size 6627444
remoteproc remoteproc3: remote processor slpi is now up
```

With a hexagonrpc patch
https://github.com/linux-msm/hexagonrpc/pull/30
and appropriate firmware from the device, sensors work now.

```
sudo monitor-sensor
    Waiting for iio-sensor-proxy to appear
+++ iio-sensor-proxy appeared
=== Has accelerometer (orientation: bottom-up, tilt: face-up)
=== Has ambient light sensor (value: 21.000000, unit: lux)
=== Has proximity sensor (near: 0)
=== Has compass (heading: unset)
    Light changed: 6.000000 (lux)
    Compass heading changed: 103.589447
    Compass heading changed: 103.591545
...
```

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
index 349faa123ff1..7c4eeff4dd0f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
@@ -141,6 +141,12 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&slpi_pas {
+	firmware-name = "qcom/sdm845/LG/judyln/slpi.mbn";
+
+	status = "okay";
+};
+
 &tlmm {
 	thinq_key_default: thinq-key-default-state {
 		pins = "gpio89";

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261122-sdm845-lg-judyln-slpi-14e6ab56cb8e

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

