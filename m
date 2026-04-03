Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6B53C9446
	for <phone-devel@vger.kernel.org>; Fri,  3 Apr 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228440; cv=none; b=Ut2wXw66n00IBE6Uk5ESVJhhFxMGNa9RQ4TBUbTBP4kSvczO1Bhrl89d//BSZFdXbs6p/1pXyfxOhYlMNz42vxcDbogChvkxw3y1BMOuyqdTO526qH628f7PQgikA/WCdc+UippBc/TCAMn7Bi5IsN+ynF6LOYNv8PSNRkAvDlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228440; c=relaxed/simple;
	bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i65JSksRbzFn3zMV4W8tojnOZMb+0Snph2qRMUPfLTbapfYZ1waOmiqDa0WsNwuh8AEMzZ/b0yNh0AuFwwkSYMf7vL18TV4rdf1lB+QJcasviQ37YahUjBdCbr2k+3+OYWUnmsp7O3Nb11lCfOTTrwHinT59slRSB1VPTfQafN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=Y+4HhIng; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="Y+4HhIng"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso3097576a12.2
        for <phone-devel@vger.kernel.org>; Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228436; x=1775833236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=Y+4HhIngxSql7BmZnRNevpr7KeD/2Vuu0I/A+U5uXfKD5illzIL1OwYfKIRkPZ2Xdt
         Ued+iCV/OCmU7BRV0dqiEuKH9O5J93hvdO4D+ei+hhQgOQ2KZMb3J+yhXIe5sC7lxewI
         OBVDcwqOvyBKnkvwtZFKuS/mPDnEvd3eLP7WtMfTWQAK5clmfIgwd5SMjd/JSUK33uM7
         SyARz0hGlRvl/i1zzARPYKiSGzuBOcbAOveiRfwWzHMSZTPpJGU5lQfsh2NNFG/LbjR2
         vZ+zZoOJWxsKMVsVPf+h2WUrUOwiSxGZ7f0UvZUdBiJmfB0FLNsrj9ZsLVPP+R9Y4gtQ
         boUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228436; x=1775833236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KsT3+v0EI1c/NqAMJW4AmWQ7Fl9ive+Tf4GhYkRHbCk=;
        b=PO4hGX2nl1IZn15Ilb+cg50R+QQQyXUKUD2ys2lD/yw0JxYDdffS31ts8VJQE9iIKq
         buCxByylpckBJdpKIHUFvfSd4+ofK8DXa0tTU8986SRM67WAzR/KhhSqOUpQM+5M/GHq
         FzIjDQjg8zRFGSsnR9nJ5F52Y4VdgGZtUUjb7/97dwbfeIa5NrFL9ctNzWFEMgvn5mMr
         NNDOMc3oIKUdFO0V8DKgYF78AriHrDIUYMDZdLYqluJDiQvUMiC9wqudyjHMJ5usVgZf
         V8dZfpTrTgTSy9jxrexQL19nd1s0+s+FyFzaTGBdEcYmsL9Epsrk5mIiKdVi3jTIApY0
         TinQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwq07UNwGS01Yb8pQ4DCyX6zX40OMVXcGDJz7z9SVIiFwdjr+k5QJrcE0mjc/GMZDOwghZtP7k4LbwBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkOv1KikqI9lMOG/d5tKUAA95M2K1rm5AQePj1BI7o86Mbz0y
	Ug3KQ1dENy2QWve4XmtBsOGJ/D40S09AIuqvQBZt998jIaua0T1bT2l/ehjWM+o9q8w=
X-Gm-Gg: AeBDiesDayRiW8r+0ihnC2vgM1pE2DO7t0j/bFF3hN6iXhbAlWd4QQroHNXO2VUCWRa
	sWy4l3L1LnB8Hqb9D1Ov557Wl/9znz9uXgYu8SGUVSMux65aJzSdKa9bWJ16IXgwjHpKY/BQ9tA
	M80MNne6Ta40MutMD4BGLQcKstkAsYF4MeZJ/6Nj3sZEEi65z3vbzh2gAnmCsIFPXXzpDXOw1Ab
	JI+53nJELjWWFcMu+941yi6NIcjc+aR3sETjuQRnFEb5yrxdYJ4VBArnAh35H+7bACyP1dna5ft
	9MxMJlUGmIDQdNppty6KAVmAoQQrNdkQ8suenAweJetYpTgJ+bG7E8PrBvibeCGRAJjSMCVX76Z
	g0WGxR/GKvvHHdhkSYXHLd/ZT2t6b51kIr1JkN8MtuewCI5hdq1DRpxobh3hlaUThFdg4bw+H6c
	YqEt0hMOhln/zEyjlNQz0y16r85qJvK4igV4D6mC3FX5w9QD3CDTtURtWr1BxyHZI5SWQbN3ZeB
	VMOr8q/EW7mgnuSdyT8xXBepnbSPcXoZrB1Rg==
X-Received: by 2002:a05:6402:210e:b0:66e:55cc:3156 with SMTP id 4fb4d7f45d1cf-66e55cc3284mr1003237a12.24.1775228436269;
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:36 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 17:00:23 +0200
Subject: [PATCH 1/2] dt-bindings: sram: qcom,imem: Add the Milos compatible
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-imem-v1-1-4244ebb47017@fairphone.com>
References: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
In-Reply-To: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=733;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=xEcUg10QJs8S2JPaCimsNDtQkFrhjDiTVcW8ztlhHno=;
 b=eHXcAGeGTKKVidTC9LLJh5TgHssAi6gn6dvlaRSpGWwMzxeU+QHCxxnzf1LRaOMTULHEuBYT5
 0YWKgOWHCKhDzzZJZDvMTcM/kcAtTYoCTZ7dRJgmc5bfK/8h7CpTKL4
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add compatible for Milos SoC IMEM.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..38488e28a6b4 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-imem
           - qcom,ipq5424-imem
+          - qcom,milos-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.53.0

