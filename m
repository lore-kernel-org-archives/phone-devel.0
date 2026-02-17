Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F35D29BDB4
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771311741; cv=none; b=m15vo2x1byGcpT1fJE0RVThd7QlCm5NcPzepOouj/TnS+zMNs2R9y1IdRDJskRcvfyR/DPWBXNEtkZSs7/2oVB3igCgO3qufe7+pOzRLkHJipfIKaATrBfOvQ5c3HBWyvfLYRa+t4S/Mx4MUvhKp0RLypq/EytlZDH9jUINfHcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771311741; c=relaxed/simple;
	bh=V8h9ZYIphVmKrXI3LnFoYg8gfobz/Rfo1Y2e1pt4HLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umZ90WEGCI2NwPP8/px5jMj2vgGvxnODMs1BA6TRZw9g3cJYt30PzjH5m5XBXIL0xvsOhRkRz5PKJbvWkgJHhzX11pEErVBLPbMOLZhss27JTyigd3uN9NR8Sa8w6ZX2j+FN/IuHOfT3HsXhs8Hz2YG2sNkn8X4dnhv6kuIwQ8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=w1L7UxZa; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="w1L7UxZa"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1771311737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmUvKLhNQi7xkDVEqgiTsgyG8WDxxFWnZAgXXNJS7pw=;
	b=w1L7UxZafmePtp2ioz5o5Rx9nX8ZkFWSxvGCVVX4dn0v8h7Mhx6gLH2yxGIdNDVIhY9xaZ
	CZn74iKcG457AuoELjGZ+YyBqepwJgYgpt3WroSNzgOENlYpF9cU97IH2sHe6yKNzVLE/+
	Azo5YcZwnYGqqG9IrO/qZcg4PFoHHcZ4vlo9sWuR8eu8OixZaRcuUdA1w7rrpz3v2hXDtC
	B/zRxU38wjY6Qu2YjVcEShVbVnCoIY+de5khbraqzVYpeY9Ykms58TaZqG/LNJ7mxqY713
	quXKpUN+PXDA7uFPtqfqXxab5+O+wZjPrnaMozgwbpLAiebViGkAgjpixH4VXg==
From: Val Packett <val@packett.cool>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-kernel@vger.kernel.org,
	Val Packett <val@packett.cool>,
	devicetree@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: display: panel: Add compatible for Holitech HTF065H045
Date: Tue, 17 Feb 2026 04:00:10 -0300
Message-ID: <20260217070121.190108-3-val@packett.cool>
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

Add a new compatible for the Holitech HTF065H045 panel that uses the
Himax HX83102 controller IC.

Signed-off-by: Val Packett <val@packett.cool>
---
 .../devicetree/bindings/display/panel/himax,hx83102.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
index e4c1aa5deab9..66404b425af3 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83102.yaml
@@ -20,6 +20,8 @@ properties:
           - boe,nv110wum-l60
           # CSOT pna957qt1-1 10.95" WUXGA TFT LCD panel
           - csot,pna957qt1-1
+          # Holitech HTF065H045 6.517" 720x1600 TFT LCD panel
+          - holitech,htf065h045
           # IVO t109nw41 11.0" WUXGA TFT LCD panel
           - ivo,t109nw41
           # KINGDISPLAY KD110N11-51IE 10.95" WUXGA TFT LCD panel
-- 
2.52.0

