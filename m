Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CE285CAD
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771311736; cv=none; b=usOtwKTACjpHk8KL7Ols2a1bVy0Urrruu3c9ZyJC8LT7n240SZahWcUOSe6hSQtF2k9XHvJFh1ef+34mgp6YQcVXDaZunbRLYL9lUTvYmca0ealIqbAw6EMdtDQclRZE2XOu+OeoN4AUGs+IkcTnWTaFG0IwKq7jddjau4i+ABQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771311736; c=relaxed/simple;
	bh=xERRjN4CaWjCqydJf2I9zpsZdided5B48f9+OvM3XY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sDtzqcnpyo60/9v7i089tbnICFRAivynWBbGtSD0nfZ9iKF2wXD41cHFin+EMcHH91H6KZDKEeQNBQlYEgmwsow2iY/j1xFMlPFlimkysaiFHN8Uflw80q9vBAL+FTfycKr4q2TxkHVrZi7S5ZcNTz0z306ks7/Ff9I5GX+KUY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=Bkls8GvO; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="Bkls8GvO"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771311732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nz+v6k1MMJh7TTRZHrET7LiKV1Oz+A66VZ9xkY/CTCg=;
	b=Bkls8GvO1a2CqbEYmMAhN05WZvdPO/XecHv6giG+yz+RgzNsmV9esbg6SGe0yXVtJU9xoJ
	7/mkMLWjXFCs+4GUHCD6TfCkkcowJFcXj/yHbBVHti187XBq6wMsNjdpW++lI09aBmo+3x
	anTz7c3cXe9PZO2ojepqMmvM633d9X9rteOkfaCHsoJszz28dgyBr9HSPoA6S4DZ4orcnr
	VqgVACC1Gz4Vxt9m8gvZ1HSN/5tl1bSYdWhTEsEEHjNt47g7xcSyFcfoL2jW5KqwmpX2xL
	D8MrF9y8p8mLU2OQCZ+9yj5HdJ8KqTUOgJC4QmrKbHGjCbaI4kI9hlYj1ie6vw==
From: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	devicetree@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: vendor-prefixes: Add Holitech
Date: Tue, 17 Feb 2026 04:00:09 -0300
Message-ID: <20260217070121.190108-2-val@packett.cool>
In-Reply-To: <20260217070121.190108-1-val@packett.cool>
References: <20260217070121.190108-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Jiangxi Holitech Technology Co., Ltd. is a manufacturer of display panels.

Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 46d0287b2cd6..646e18985a9d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -711,6 +711,8 @@ patternProperties:
     description: Hitex Development Tools
   "^hitron,.*":
     description: HiTRON Electronics Corporation
+  "^holitech,.*":
+    description: Jiangxi Holitech Technology Co., Ltd.
   "^holt,.*":
     description: Holt Integrated Circuits, Inc.
   "^holtek,.*":
-- 
2.52.0

