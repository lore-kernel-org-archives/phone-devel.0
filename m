Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7492F39C2
	for <phone-devel@vger.kernel.org>; Fri,  2 Oct 2026 14:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952604; cv=none; b=mI4Fg5FSH9Uok8n+LwShfPrcB7xTFhzQoLHd4fwGWbtPSR+/y4ubT3+LyuRovIJUuTPWSgAGqDKLP9LE9t+lugMJ4Te1pZjGbUlBSMqWhT9uSs9cywlXOrovzAnlVpz1rF3rqJOFHXNcDtTRC2UBqiw9XC+b/oIozj2wfnKWl98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952604; c=relaxed/simple;
	bh=KsRR3Q6/pxPTL+LOpQhlv999N3C0D2jsPRy7RKoQGk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CpTvhVpP8ocNHOn99ks7aDVj/K9VFSZFOCTvEquR2hpV4W3/J9J0EnzHB8IdYU4opIu9Fl4cnD8W+YvWrPPU0ndveHJQBCD7oyUc6bED4cuJ1n7h5eso/w1Hb3zJjKXhADG8mkW1iX3P+EaHGsLs4Yj47hLpuf+dfhok3HLXPV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=QoWFJtJ7; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="QoWFJtJ7"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e227422e3so16687466b.3
        for <phone-devel@vger.kernel.org>; Fri, 02 Oct 2026 07:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790952594; x=1791557394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azHVxl5Zr31CbdI5TNnzZtKhiO2dgRAGT9lgdHF1uxw=;
        b=QoWFJtJ7DADvRhIvCRMxgtMiYgqRaF0ZUCVCahEPv0wqLXdEu47rK9cK74yLvxt1O/
         Hy5Fbb5pt/6kaIJftFGfhP/E7Gi6WsjH6vdc2V3v4StJb0K6pLVuCcGk7/4ee19YS4xv
         qLT3PjhSRqrx5wMfgs27B7SR+tObNEZYTBooJyoJV4sE5Pcj7WrMUHT8aUJiOhOeY2aE
         3+B3xkdrha3/1LBcDsdguzj1OjOfcDcv4uak68TUrL19JhjGpps6Ng7eLQTAjpbRIVKp
         OlGdbTaCvg/APBzy/f2Q7OrJG8KLeL1akaCaenqrtnlgU5cTJvCBGi/CJs/MvuAv13w1
         5knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952594; x=1791557394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azHVxl5Zr31CbdI5TNnzZtKhiO2dgRAGT9lgdHF1uxw=;
        b=Gp3Yf/oHHsTAEVVMm/M17THXr0d+KyBdEppeyHOwa+XzZAuPliLy2WQd20RVYIW7s6
         TlQ3USrxS809WR9b37nNCT07RbaJAXFwXIRkbeK2RCkzgRgFPtmWNvhEnsmOyCVXuuzp
         xxJUWJS0G3ZQOnLrqqAK9gNArGK3Yy7WIzJ8Ir/0mIF4VM9HTQTI6vQfjYRSiOyMhTYf
         SxQ2Tj7qeIQCV6B0hmdEuE9PW6v22B2Ejp3YQqGel9821n9/FXB9Yk+u1oaZMsxTnma8
         qUoAVxQnNeoaXknQVz4j8o5yf9pLLViJ8NeAIBL0yzOJxUm/deneEmt4g/6gcs/PMsoe
         bIeg==
X-Forwarded-Encrypted: i=1; AKwUvByxtJ1yQWPPdiegAcU98/BpJgOYcFpyJr9rOeYUKIxehc889XBv4TUcDEVAQozbptiXPXI8ai8GNdrMpQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mgiZSK3vI+U7hO4YNjJ74PZmb96itDISW/5fkLy2zZr5OftPSl
	XHGyFiBNmzFzKS9O8Sbzusk5IdvdTc7sPwpZ6jBrLUuA2CdOQciAp0CHMVdx3obIvAo=
X-Gm-Gg: AYBFou1qdYhAOFPQObRlb713iYEBYpxQgZe80/GZVcL4Ogt331WjV0TitrI3gVwckIf
	cQlcLUgWXy/vuQgasQw4yAuzubyMQus/HvzqpEmR+FpaN0zLoEUSm/7OJgJ3FeNvLUiRuyCeXjW
	1jPV6+xRXAyXQ0rjkQ4IeTg2Rt+uGBPWcrE5HbPotGcshtKuea9GeOJ2G5PGSwM0fvq6f+2WMG9
	oEDM6Bvonl/gBsenjzx/yIU++0gX9Nzvd6GYWLMrBBuOVUgafZHP1oK+zC5/5+07LifqR+tNENz
	hFLUC2GO4Np79eAtCZCgXYXAG8J72YQZAkaA9Y6VAOtTk3PEclznMeNiRy9DLw9AudaTuctURU8
	m4DKqOsxEraj0JqM97ZPTS5vH/0s4Aux5cy5LT5odXUX8yb3FL2g9mYNODaUWsnnvVIZUaLLiy0
	93gC1Dep+ttVTR5AvvN/iLVoICdO0q1vMjL6wwJcMtAGdMAkBVO1i/dSeO+pMfvbSKNjMgZSKyy
	dSq6QtYx+/EfaFfGCcS4NTdOHNe7AQbkNePcUzcbG2cjfEJHl6C
X-Received: by 2002:a17:907:9403:b0:c2a:f8e2:4233 with SMTP id a640c23a62f3a-c2e4af31f56mr209928066b.19.1790952593938;
        Fri, 02 Oct 2026 07:49:53 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cfa656bsm94539066b.74.2026.10.02.07.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:49:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:49:50 +0200
Subject: [PATCH 1/2] dt-bindings: display: panel: himax,hx83112a: Tighten
 compatible matching
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-hx83112-compatible-contains-v1-1-d558635ab7fc@fairphone.com>
References: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
In-Reply-To: <20261002-hx83112-compatible-contains-v1-0-d558635ab7fc@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790952592; l=810;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=KsRR3Q6/pxPTL+LOpQhlv999N3C0D2jsPRy7RKoQGk4=;
 b=d1WlKoOFC109aIkEZsjUlraQFJKKd8F3U5nRRs1tjiGq40q6Pq3YfqVmFt5pLUIkq+oIHMRia
 4hFq1w3iyYqAdDwXY5xfl9gr0XD50R9ZuRDHegvB59n4o2aUr+lAUDW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The compatible was defined too wide, we just want "djn,9a-3r063-1102b"
and nothing else.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
index 2c60d0cd704e..3dd9b25ff13f 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx83112a.yaml
@@ -18,8 +18,7 @@ allOf:
 
 properties:
   compatible:
-    contains:
-      const: djn,9a-3r063-1102b
+    const: djn,9a-3r063-1102b
 
   reg:
     maxItems: 1

-- 
2.56.0

