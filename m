Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D154231A3B
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771288045; cv=none; b=NdwEGk3UchzHVEtgSvmUPvB7kkzjSyR1cE5WKZX4UCNoyAUhue7eXak5uuBLb1xiDXk4n52sog2fOI75dwbJRBmnIh6Nh/7QgWPrRsGOSmPo40DMh7gxBSmIZJAb+Zhntt2sLDe+JSk30WFULOEtVTUMoEC8ZCoUUWZ4WAUSMCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771288045; c=relaxed/simple;
	bh=Toh8WfeMNLXt6DADlEJBFqnv4eGFPJoSXPt04u7zLAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqzQc5Hh1/+FoQBROePdGzUPrgRTokKM+KtCjvQqJTUABy3KeX54oF0oohXSXdMjqN1fHpnD06jJlb+S178V43Ein8ukIg4ETG8DVAHQvY4hSKE7gQUQo/BV+hkq+oD7QgOeF+38YEkq1DXhTim1GoiGFKvXDyuGwb8nJhpmMQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cv0CQp5X; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cv0CQp5X"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8c7146b0854so389037785a.2
        for <phone-devel@vger.kernel.org>; Mon, 16 Feb 2026 16:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771288043; x=1771892843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=Cv0CQp5Xj8/RZV1Ej1q42HksMP+0quklMfTfzYis1u+Oe3BpUwEEBqdIIS64CFox+H
         /5jI71p2YUfRiX21+kGK1ZPc3/oPkHisbiCGzMnEfw/p8Rn/yISE4gzhMtgshUTIDBTK
         d85GnbGKX5GmiglSRkIbFWqWpQ6m9mKJ6iJe6L0TXrnvb04qunL+SSO9ALUVXBU6WvF4
         gx2Pnk9lPJ2YqYP2RLqdxmgKiSmAwv71CXRmX21IBUkwwuIM8IgXqWzTrSGCaoY/ApEw
         BNMi5Cb/YIA+oKyZEx8DssWJpnkCM47RG05ZvoFaSJsKbf88aR6KDBJRfRUk1IwJiD+t
         4KtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771288043; x=1771892843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5bkLrppSycIxmkV68TSyhILxOTHj6vATFc9npwdaNyI=;
        b=taRUcIb9G0IiHD9ngZA6e1tu1wwyg70ymwxeGbHSlkRRmy07h0etU8CQSJ4+YtdAEu
         vXSlKyV8RGGam8JCkDR0Zr3m8bYaaCNnRHZ7d1HnemmTkfY27PqEwYi/jq/qVtsjVqMa
         E7LoOy/bt5hpKBM7I/ADdrRbsQKwKLbhko/NntZRtBQv+IYNIgl2PaBDmypsRUFgyqq7
         NOQUA6QKZ7L0ipk7YDpKOtwXqzU+hVHN0iQRX+P3TY299Cb+8F5li19lK32AbgKRtOjl
         2wIEp4CwGEfPx/FAaXtkvyhuLKYv5erMfbvxqlSMTOLxKMT9iHX9BAaAqWPptkS4ECJe
         9f2A==
X-Forwarded-Encrypted: i=1; AJvYcCWO1lq76x63jlex4acaj8ZetHVCrEvPyr6bN9/rjEd+jSXAeKPot4we9uzQqHzAND+LVYZC6fGeiIKeAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlazeD8jvj1Zb89QQTEbUkKDFfHveWo2fwC/H1za93FdvOk5Hl
	qKFZL63tKV3vej1xSyJQJ4MitE9nY0zM3qVvKspOujdcyug57RYtGUmP
X-Gm-Gg: AZuq6aKIRQCtzIz030xPjOoGnI9dhL5NlO2MXPjhZhE1HLCq8dGuv7qgXl2VoFebaCm
	HCkYw8yUEAuwS/gu+VkVAsNcUtq5L2SghoHs12gMxIoNCnsNeRLNI9Aqw455ltUAYTbU1tk/uU9
	tHJM5MCsuypNu1ROeS9MAMxoBCOeiPQlEsAWxLUmRIooIqQ7rU/2pqH935689ScW0ladcoFr5xI
	RrF+125mxkSKP/t8B9H3h7+VZI+pnv2gtZ5k00Y5GOn7EFsRPq5Jpq0zFoJDerEx8RWUcvuGdDx
	6emUb7old09SF+jRFDBL9AY+yVxWt3mxXjPfWtUQ1yHh9D3+DiSass6bgowZ7BHgvMDMwC3lvj1
	FIiWjirkWViIVJA3ZDlsyE3Aqdzvr3tYX3oBdTRcpZFVkPq2q8Nj8PKWRrzNXpvhyQMjGaiZGAz
	1jpvvhTRw4n6FRmv2qGs4+16G/i0knDQ==
X-Received: by 2002:a05:620a:4495:b0:8cb:66dc:9fcd with SMTP id af79cd13be357-8cb66dca52amr244592685a.56.1771288043428;
        Mon, 16 Feb 2026 16:27:23 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8971cc957c8sm156277346d6.15.2026.02.16.16.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:27:22 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v9 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
Date: Mon, 16 Feb 2026 19:27:32 -0500
Message-ID: <20260217002738.133534-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217002738.133534-1-mailingradian@gmail.com>
References: <20260217002738.133534-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-lanes property has no effect on the hardware configuration, as
of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
clock-lane property"). Since boards with new camss support can omit the
property, remove it from the required lists.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..38b308f441ec 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -124,7 +124,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -147,7 +146,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -170,7 +168,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
-- 
2.53.0

