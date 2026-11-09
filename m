Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262544;
	b=AVg5vw5xZtsIhZ7VdVG1IRlbdQDxRm3tsG/EEcvSRnAbJd3LgPy2NaiHokcmxn/4OrV4
	 3B6RkKarkB3UpKEKCVByjHnsMKpk8jtIbvTURM3VPx1sC4u02rUzjORU1JEmyx5rY9OGM
	 kFgbdII3xrio3eZskARJ09q+GwJjiaLRRqMx0N4ooAsVNeKqod5a7zdk9AE8JpOsZmqNX
	 m7scm0JzWGFi07f8e6jZOFd5rYhkUYHSPxcWMDE3iwRlHdP7uASHfblCsJh3XF5+JT2LI
	 1vcRzB8o8w8msSw8mwnXBbFoPmBl5TvJ83CbhpJ+TiO0m6Oo628qT7QD0wd3a9ZDxBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cnbWzp8SRYw9JefcoG20foTHGQw84aM7Os7qfOEDv2g=;
	b=OoC/EQUroj1iCTVrSW6KPBuIOnCPsc9UgO0tFSJRsfUsAhQwguPRkm3H3U435Q0+P+mY
	 /dvrgSYPmkI9uu9oUFCa8YNeGFcxJJCtP9wCWFXj2XCxZzELmImhHO2k+ioIADHFRoegS
	 /A5pvcfjyMy6YCL1jacqivn3XJTM+mmRrfNtbs+6Gri5JP39aiUH0WAhtKuILJcE1dm8d
	 eDTV2BHYKPQqf3c5kIQ6lY/MuZRK1hNzIdcg8G6icsQjO1pszHOZ0stMe8K59BXjtxGd8
	 3uLUgDWXmaZQ8DJIq0/6RbEQ6PlF/LiBt1WfpwMZUlwNS88xr+H3fmQ5/HzADkXCBCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk;
	arc=none smtp.remote-ip=91.218.175.126
Received: from mta0.migadu.com (out-126.mta0.migadu.com [91.218.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C502A606A31C
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C502A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=nm3X2TUk
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Jz5VysEAlQcAxLlojRgxtAz9V5M3QMUrbakks1zM4k8=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262542; v=1; x=1794867342;
 b=nm3X2TUkLCtFAcB756h2Sjpim385SJKevpzzsFjEam/gxjtEqGNPmb13cV3KL0fJvJFick9F
 Cwrtvg/m5WlYvrODPKPpfD3gqG5g2pyJqxGly/VGlEKeDR+5z2c42TtCy886+fNM/uXwJB64mcP
 tpxDwDtNuSNC3V6QUW7gROVMac0yPyJh0zP3iuxUrQiC967sL8+G9MB5EKZbaILjLk/wtrWcXqj
 xjnBqO0eUiZJZACy2j4DmfVybZ8BNzQ272jxNC9b7saBrh28QFZKvwgU5009SawVzJd0b1ezFZo
 njTMnQ/iU9BMESPAjkDZQ5hE5ygAZu6ZL/5jWpil6SEjg==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2300422c34a38f09;
	Mon, 09 Nov 2026 22:15:33 +0000
X-Mizu-Trace-ID: 2300422c34a38f09
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Michael McAllister <me@michaelmcallister.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Power
Date: Mon,  9 Nov 2026 19:14:31 -0300
Message-ID: <20261109221453.658316-3-val@packett.cool>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109221453.658316-1-val@packett.cool>
References: <20261109221453.658316-1-val@packett.cool>
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

Add compatibles for the Moto G9 Power smartphone, codename "cebu".
There are several display panel variants, start with the Tianma one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 37443849d0bb..9c463fce515d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,cebu-tianma
+          - const: motorola,cebu
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - motorola,guamp-holitech
-- 
2.56.0

