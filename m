Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086B831D72E;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904204; cv=none; b=NOhCUxhn7NcwkZ9Kxg+actpP0t6pLzlBR93t1CcLtlZFGRdw6QOYD7SLUAc8UqNBOWitKyvuiVJrWmqtRLIG9mxtfyCDXopHPzLU5Lt/S4fKn3+PqU6pdvQejEv8GgVMd8l5AI8VqNMTiSAR0bTIuih7oggnypliMDKv3CiqnqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904204; c=relaxed/simple;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2JU1Xmer6Q5GOnTsw4J/mWEdrB4lphUgULUJOP+eed9b3+AAMzha4aEvlZ9pe/fgi7LXRbfHzycx340L5BhMvGrtxOO2l2lEvC0Z5M65xtRBl4hkHaQ3IxZSVldqk1fD1Vt5pnnuDcqWi8OdYc5/+dnzvhZmO0Zyoi6a2nP1O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGyHphJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGyHphJO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8428C2BC87;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772904203;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hGyHphJOc0AmqvLQcxE9ABoVehDzj40MOygVaRQ7crOQDHVDjkBtDsKQowLkMBltg
	 fmpqGISBPstBQN+i9RvWyKn9AAT1W/Ux2YwUmdqf1MoPd7dvhvbt95sKQFEya7Bwjk
	 oeFkCfDP/0T0M4fvytQ5Reu5dHkCiRik6t/DU4VBja4XwZXH6oeNfEQemT6RmT0Pb3
	 pCF0dmEaqV6l2G8VMxHdduEAbQskuaAZoJbig5Hd/rJB/rgpE9Y5C2yKOzV1NtGhXM
	 iXQm1kfKzQLk1a/fX+h3AYOT6e0jphjncf1isX7O/wiGNQi+97bfjg/kv+Zbu4McKM
	 5OuRUf0/2/lAA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1580F55104;
	Sat,  7 Mar 2026 17:23:23 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sat, 07 Mar 2026 18:23:10 +0100
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260307-wiko-chuppito-v4-1-325ac66ae338@posteo.de>
References: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
In-Reply-To: <20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772904201; l=846;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=p71bdLWPgJx8YbZwRJN3OjH5dKZ2Biw/XlIKc8Hj8V8=;
 b=COGpkrT/qwb78CSninXkVsxU/hwvR7di6vDacrRIu2RXUX1Tr2Ypp5KfHYvSSisShupVwyX7j
 oLbnVjoxZNzDnqM5EHifN7ckR2TKgpnc92nctk1vzmD8LNGHBVQysqT
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de

From: Paul Adam <adamp@posteo.de>

Wiko is a french smartphone company: https://wiko.com

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Paul Adam <adamp@posteo.de>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index edbce100cae4..187089eef983 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1819,6 +1819,8 @@ patternProperties:
     description: Wi2Wi, Inc.
   "^widora,.*":
     description: Beijing Widora Technology Co., Ltd.
+  "^wiko,.*":
+    description: Wiko SAS
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":

-- 
2.53.0


