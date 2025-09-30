Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38195254B18
	for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759238849; cv=none; b=SH9VNZvJ0wP8Mqop8o7WrbjQKa2NrcJGhQ4QxiUZCTf6Au1vUL2y+S8leoE1u2Ux7nj+uOb6zZrwNr8Vy4AUw9AYLco56opGBrt2FGLbmIdmVaI0n2kbCPJTAUxF08iQG98jAxP7UGGpN25g6j+imRjHTPkXHO8oPxmtMePLgNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759238849; c=relaxed/simple;
	bh=p280qPQj27zEghzXtASKe/5ZJm4NWAcJ5opk5rxq8ss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ej3NE3BdfBBykm63ClLy4BOX7OPhL95d7O5OqTs6g/Vd2clpQSUv6OLNlUTjsAF2Jh5rGA+8WSLVnVpvUuBxyN2kd+YscsEorY7Ba2ddpG0/NttiYIk850JPyOcbsNA11CHzKRh4I84vOVy/dZ2juksvm9s3vL71qTvOmunjiYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/DOm/ft; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/DOm/ft"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3be330b1f5so614682266b.1
        for <phone-devel@vger.kernel.org>; Tue, 30 Sep 2025 06:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759238846; x=1759843646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=g/DOm/ftd7Mj7D+q5GPZ47BU5tOLnmY/ck72FUktAk8JpiKghPMqmLJIz0rRJfA81z
         rajwp1wcZ/X1BzTw2EVxRWx5jGM6/kH01th+DYTb2komLNSDQQNmlEd2FOtn2osljmMx
         CuKlWT0RI5C7Xsq6pFCKE//xChYbWvR0TvlQSKV2Mp906Uy/IJXlOlJNp/rz8QN8Uz+G
         9C5UxKLCVyC+irERiD8xWv8QMIle6h9li9nKkKuQ7AAvp6Sggbi8373izgrnWkxaiP6G
         FEVf9fJq7KUGrsB+gVnA/MiZEflRYzcCe+dVMaKDLbz/AtEw6SXJHJfZk20IiD5yG7Pu
         WcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759238846; x=1759843646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpsQ648q3C0xKugj4mrt9FABQZLoyanw2vv+wH0Qsz0=;
        b=P5HxB5Th4LLQ+jNBsDf5WpMmHuEYYhg8UlShJju5iVikWZ5nlb7AYJBwXXCB7Ufui/
         N9n7lST+Ux550hKmE8MFt4v2AVPC6sOmcqmNwRRgdnGit8qHz9aEfiiPbUlII7wSS8oI
         Nc22iOvInyGMR0vvwfc4nbJomIuTJAK9qNCGaYlEnhFzP0dntSktLHWAF8m7y5TsFNp8
         JN+cf7XM+jqRH4aEweH7YvWHExPOrhKuybsIGM9F0QXplPlJF9iiGDOFelvJSbu/o2LD
         99YWnOhUHXk43sEPrU4nIsf7AYC4sLXcQu5kYFlI8Azdsrpek06853ptUcmjXfz+/BIO
         6VyA==
X-Gm-Message-State: AOJu0YxWtLJMgmoC7PfENC+b+TdxLflN4W9Zuz0Gede367/+gFdLG5+T
	OP989TRwtl5krcdrKMrtmgFarSh3GHiT9hGuCTzTCdB7GfJWLP+bXZcq
X-Gm-Gg: ASbGncv4sFfNlneoiIXo0PTThWpbQsboUa61/kLGnlqVPRmPh+vAfk7zmBApufogds5
	AmlccLZm6QOOU8ucywy+TOvp1w+QpJI41eUUkkUvb//g7y7Mt5L611sm5DMWUbASnBSk8mfmD/b
	KYEyGFtBNrV1dPlVRtplVdPrfbi6nOHWYPFgwDvDHsZId6Uz00ZQ4ogMQvT/nwunk4JQB09XukP
	o/C5ElPnseEs8JsrQjKbmsnq+gC5Vl0UcsQlaJpOW+b1ChdbvgEb61l4+mnknoCyoVBspf1XXs9
	lSkPONC+WxRjYCm25tZg1CW7QVc23MSfVN2Qcn/Srj5UlVp371F8kJUWUikc5DWx/AT4uQ1I1WH
	wpoBhS+EtXhSzYwGY7i715EYVGZnT0KOJpfuwKP7tJxznKSvfKdK4xfWHqkNJaaSQ3g==
X-Google-Smtp-Source: AGHT+IFqZj82HIUPV+dIzJvrTOxVkE1LRYZqyDhYctKIsl9P0BboCTyc7K3Z5HX1b2xDNVD5wraHXw==
X-Received: by 2002:a17:907:3f88:b0:b41:e675:95cd with SMTP id a640c23a62f3a-b41e675a6damr413544966b.13.1759238846374;
        Tue, 30 Sep 2025 06:27:26 -0700 (PDT)
Received: from crusty-box ([88.223.153.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353efa46b2sm1143934766b.24.2025.09.30.06.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 06:27:26 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Asus ZenFone 2 Laser/Selfie
Date: Tue, 30 Sep 2025 16:20:09 +0300
Message-ID: <20250930132556.266434-2-xerikasxx@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930132556.266434-1-xerikasxx@gmail.com>
References: <20250930132556.266434-1-xerikasxx@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a compatible for Asus ZenFone 2 Laser/Selfie (1080p)

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 18b5ed044f9f..1ad77a68fc11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -88,6 +88,7 @@ properties:
 
       - items:
           - enum:
+              - asus,z00t
               - huawei,kiwi
               - longcheer,l9100
               - samsung,a7
-- 
2.51.0

