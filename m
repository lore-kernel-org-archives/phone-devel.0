Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBBF2DF144;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771707383; cv=none; b=ux4R6D9jgJFcy4ISS9tazOcRtx0ckwgZsZ68Ep9rVN1cB4IUiCJSQ6yNWd1YkIPqnUC5UyhFYt+d8nTm2T4g2pl9T65kPIlgxWMkPGa2Uu4K4gEl6Y1LCkzyYxtMnorD8F+BULhi6CE3z7TmPxZllZOfLZsHagLPc4gmYWuh76k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771707383; c=relaxed/simple;
	bh=zBqhQDT+hnJ984ssWXmGYQLLXltnzLh80qoTcfFUXQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi0BLFJm1AP5MQodx+VCD3YmpkCnvuc7uUgwFeqJXIHZRSOlSTVp7wq/ZhBN6pGiwECRhjInGOY/aG7q4J0KD//e8twwtU8RX6IUFmJHEBY6rW2+6v9hUW9o7SZPlpziS8mLqmTEcdeilrq0MxFAFs9EQZQAedRZ/QyF5PD+GQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fZ62Cm4v; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fZ62Cm4v"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32E81C19424;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771707383;
	bh=zBqhQDT+hnJ984ssWXmGYQLLXltnzLh80qoTcfFUXQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fZ62Cm4vTUhPNBa1AcleP0UL2VNauw/ty5XwEsvfOFhveqqNK7l4pVqOCbXPJpDzA
	 jLpdbDsbXEuLwJ8u4C2zHFFwBCyzgF838RMx6NgpgLkH0bQUceX+4jXJYNYSudJ2Nk
	 LKUXXk2AzIqzNGBA3EacVBWfrcC2i5qUdX8J4qRTp0NPPJDbvUgNA4tP/WzMOmjmoB
	 7BVb3jHjWjxeh0w6QrfbZmbgpCMlUvNnkehrsk0G0ERONxOo8S9LpN0EJTtcbfQRNV
	 JWhJbFlzlZBZh5g8CCXjm6usX5LaLMCN1R7t/AtDbE3a+m46pdQrI8FFljbjZlo7H2
	 BX9zCP3UxWuyA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D49C61DE8;
	Sat, 21 Feb 2026 20:56:23 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Sat, 21 Feb 2026 21:55:39 +0100
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260221-wiko-chuppito-v2-1-6336b1b12389@posteo.de>
References: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
In-Reply-To: <20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771707381; l=776;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=Rs+yr5D864cNHfXk1DzW1L8G7wgznfKk+XEWGUo+DkE=;
 b=d3+EVLBkeGveuRkJuaoz7oVxLQUDTWhzCTlGJZCbwpLQT08dc0Ca6kfWMMVqA0vJD/pu7RTpG
 Ra+XDOJkhzNAmT1P3GJlzT48mDdG4QWKt8GMF5p+XMOfmHxSEb4PPmn
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de

From: Paul Adam <adamp@posteo.de>

Wiko is a french smartphone company: https://wiko.com

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


