Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262530;
	b=FBW/N8SeIKurp2yet0bv1s7hmmGcma3ZRqNU4O9nvirUCP2AhcN8dSrcFWB/UOxF/+zb
	 nal3hv5vK7zjYsq0BhdH0KEuaIHqdK+EuOiB6fPw0DVxvqxdpUOkuxz5R4dhV27Sodtve
	 /ELaFKeLL36GXIq5oPu/SK6HpcYwVTTIPAfe/kXP+Zx2zUSlvp2p5UghNfUYygsAKwHY7
	 xKGUdN/31MPqrfz8dTdHUcwfbLbv4Syi+/UzQqiwcHkM+UCoqtDnnpbD0BKFuKzO1uo6w
	 GRzKCd9WaNCpxchfUh6MtE9f5kPwhybnOjnSXdPJnMeRwFX6J1stKQrOo8RDLQ6dReA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262530;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4lKRGPKRjEBS3HRBukS+pW+bipLW37WZwjli8JaaFQ8=;
	b=eA1+CCszrxyi+mzT+Rqjdg+za+fMlN/5ZSEk56ltZ6f+0eeF2GPsvjnKFGWwzqWiiplw
	 N66i9OnfMEctXyOzwVCUKZRUO3nwnunc0sJN5fxw+pevohlWTwZIlvyjnxuP6jKb+fnVx
	 +eOFORwctqEcX61lMXzdlq/9Hpevc1AHURYJdh1OSYBi4RZHiQsG3zslAaEw0T0owDIKE
	 iDCl5siyXAaNVTtctpW5d7QNqA/z8rl1ixk8+h+Z8iT27Tl9mqFiTmTsOKKy2PqPlpvB1
	 u9BcBJxsVkoASPbyg4ubVZCw4NrTUxCOthYNGm9EcwCb7fF51oXcLy5ckyMBLfsBFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=dmS3X8f4;
	arc=none smtp.remote-ip=95.215.58.13
Received: from mta1.migadu.com (out-13.mta1.migadu.com [95.215.58.13])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6861606A321
	for <phone-devel@vger.kernel.org>; Mon,  9 Nov 2026 22:15:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6861606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=dmS3X8f4
X-Envelope-To: phone-devel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5rXea88LMQSd6M3OaqGX1Vmyk7bSpvO4oRK6rdtigS4=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794262528; v=1; x=1794867328;
 b=dmS3X8f4MbVLBfOsbMc8SZ4iw9NtzyqDUJz2rHi0DIgT4wvX+UUnepZ+G/Ztck4O17Yzu2+G
 r7njJcp78HvSME8K3UMcnt+W5yovlYif+LFB72RoMgqIdBwEWdl+RCdueJXLbCr6lHHAw+umhqR
 tTss/689E1l+2DX6fh7xehCgOVAwPjoTnclwXBTd7EoWpIhU1fwUbxTE4ftK43yHyBq2KwQpBDf
 rxqcDaCsxoDiWLkRMv/ITJOTP2N/5TX4UjxJQvOCi9JF7do837OpO1RCEqHKwQ21Uv2P7bcnGqw
 3PWRPSV6w2ZF99Tu52oxuso1pIL4ljfQ0rZn5fqtQWGxQ==
X-Envelope-To: phone-devel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 4e9c1d3d8c71a54a;
	Mon, 09 Nov 2026 22:15:25 +0000
X-Mizu-Trace-ID: 4e9c1d3d8c71a54a
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
Subject: [PATCH 1/6] dt-bindings: arm: qcom: Add Motorola Moto G9 Play
Date: Mon,  9 Nov 2026 19:14:30 -0300
Message-ID: <20261109221453.658316-2-val@packett.cool>
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

Add compatibles for the Moto G9 Play smartphone, codename "guamp".
There are several display panel variants, start with the Holitech one
which will be the first one to get an upstream device tree.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 74f46697a363..37443849d0bb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,12 @@ properties:
               - xiaomi,lemon
           - const: qcom,sm6115
 
+      - items:
+          - enum:
+              - motorola,guamp-holitech
+          - const: motorola,guamp
+          - const: qcom,sm6115
+
       - items:
           - enum:
               - lenovo,j606f
-- 
2.56.0

