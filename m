Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230B93E9F7E;
	Wed, 11 Mar 2026 18:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254826; cv=none; b=TH3GtTGI01Xtd2ba9n4x1+hRDax/wu+KIzSy2+gZpgOGg4exd71AxLnTHBLRxa96DPCumXvWrCTZwGbbL1BVLpBcUXTJuG6J1LfTEfBDsqemQCbtOipkTpYykEHaCrveDiZMVFnu9DUN4a9yeciEv1hTLH+w5YPRJkXSiO4bw14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254826; c=relaxed/simple;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fi2DJWPR7HGh0QiJOxnbIPoLcjr6mVxudAPsMWmXP+ok+7q9U2FJPTYVx86G7MKcsdGRecXeZPTs2b+/ZL3eW5B8b0/NbTvAeU8iGAjxKkIssFrQv3gVklEdfut0ldc8O8smkKcu3AAGALces2OCUni3E8gGRgQFyN+pKfiDAOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tEM1pJGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tEM1pJGg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6024C4CEF7;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254825;
	bh=1VjOIV+JF8y9xJlqX2nPiZnivzjhq0ajPuN1W3AoOaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tEM1pJGgB9wytYn4b9Q0W1BBe5hzMqo+Xvp8nzwCPRXg9vptNdGIRKK0XpC5msjeU
	 0eROLVjNXfSyeMSmnO2jdSLE9ivkWuC4kYUNzh488P4SbFP7qEuC/ayxlkxuAA+bY6
	 dEtgmHYMy/BgsXJHxgEAhZOQd1+SEqmNcDOwn9LHKpUIQoQWmJS01+gFR0jX5dXfeF
	 oa3q3Zil0ogKhtnLHpEcBbDY9fpttXQKoubPxI5ROmcj9smm1tqjSlofKdM/SaZLda
	 DOgWlvCbdYCmbHrNj0rqGrEUn9tKPtmmB40QDcESQTedfwiENHY9qT4wFrqH5ZOPtf
	 ougYborn7ENlQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA9B1125811;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Date: Wed, 11 Mar 2026 19:46:05 +0100
Subject: [PATCH v5 1/3] dt-bindings: vendor-prefixes: add WIKO SAS
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-wiko-chuppito-v5-1-0a8656cca1b3@posteo.de>
References: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
In-Reply-To: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773254823; l=846;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=p71bdLWPgJx8YbZwRJN3OjH5dKZ2Biw/XlIKc8Hj8V8=;
 b=opvvvCVoQ/hCcuZAJfdOn50euGcc84PZum9AYCNJ8eg0JhtpBXXbRIam3g1wZFPdMMJebXMqY
 xDNWxilQRvRBJZZz65ngAC/oTjGojjk5KAdVI73MEVdI925Amk+wrwv
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


