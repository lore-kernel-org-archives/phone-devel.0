Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD9192B75
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 00:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781482119; cv=none; b=j8hDgYdx4ufOYP91z0ju4Q1gBHOTRM5ad03OxX/9cf30EOe7qDUU4f95nkrRrsgda7wq/Bm3jU5enmi4ZGk73gRMHPOIuZX5xj3X7p1k140RfjQ3jQgibjWpe1xBf37G/0C9wv6wdZ9qXMAo3mN6KXg/nlCCb/thGAf0EyjfJdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781482119; c=relaxed/simple;
	bh=g4LsE0oUeBORs6EP9fBGYDXKPlMpulzbsT65r0ihbYE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l1tBCZ9YELFU65ZO43vcUsTUJgTAMb1zf2KTOv9DtSBBUJT5Pgo4pNPh7CT3UUwSvWXrQlHRhS30RbX0uH+HLu9+qi+aR2GwXdf7pSaW95E5T+/xpSIrs1ug54b0kgdAuHBleu/lEL94QadFJnPNdnD4bEoaeyGh4NJKRR6KQnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=BtkmzVTj; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="BtkmzVTj"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1781482116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8LFnjM2WcVsdQ7iGTQq/KkiMHSRoGfQrE7FIyOH5nQI=;
	b=BtkmzVTjRUnJvv+bFzzpEz906LMqB1HG/liAPHwyakSv4lmEeRzd/U2F36xmqyJKKTRtgJ
	nhPigEg+HrP9cg/HQ9zMa+jvJyFgphEDzBn288kzaVGk5Dt3CH+/6UhXC5dShioZuHBN0R
	4tljkMvhHBH/FXcyziQhzzz4DrpYpFuIjkc1KjpGWBhyJ++A2gpYnTyrQpwYkc4EUk0dGR
	vkYv/a49C77Q0izK0i/q2ZCzJv0gP9EZhOHdWjso+iuXRk+d5ygW0uP5d8cGHiGRLulIhy
	GFWfPSVaU0k2sdhZm69Yx13PB+Ez/llKEZB3pks3CiKQhDxcn9KJlPHVjghnQw==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 14 Jun 2026 17:08:01 -0700
Subject: [PATCH v3 4/4] Revert "dt-bindings: display: panel: panel-simple:
 Add lg,sw49410 compatible"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-judyln-panel-v3-4-07f4134441bd@postmarketos.org>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
In-Reply-To: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, David Heidelberg <david@ixit.cz>, 
 phone-devel@vger.kernel.org, Amir Dahan <system64fumo@tuta.io>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781482095; l=1194;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=g4LsE0oUeBORs6EP9fBGYDXKPlMpulzbsT65r0ihbYE=;
 b=yU0bx3nb755hToRHoxxFdjdi+4LOx+YcSylY4MqtdPtN5OS/CYDBNw34gllXFO+2yNtZtt7rA
 KG8sc6lXygsAiNgHjhjESTiPrrNjzVxUBo6YnAPHnuC0lrWhYwdEYyx
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

This reverts commit a74c2e55ab66519ffa2069ac9ae83cd937bff4c4.

It isn't actually panel-simple-compatible, and we knew as much by the
time this merged, but I guess maintainers needed something to prevent
the dt-bindings error going off while I was working on these patches.

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 21453f0d7ce2..58303a767a36 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -204,8 +204,6 @@ properties:
       - lemaker,bl035-rgb-002
         # LG 7" (800x480 pixels) TFT LCD panel
       - lg,lb070wv8
-        # LG 6.1" (1440x3120) IPS LCD panel
-      - lg,sw49410
         # Logic Technologies LT161010-2NHC 7" WVGA TFT Cap Touch Module
       - logictechno,lt161010-2nhc
         # Logic Technologies LT161010-2NHR 7" WVGA TFT Resistive Touch Module

-- 
2.54.0

