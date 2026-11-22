Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795374480;
	b=smoBOygMbM5G9jWApoAeQjA9K9bAbhccV+bbUTO6nmXusOO4C9rZC7BOJzQcXCstaXew
	 gFEj5n4ti7iOwUkdEFIhesHDCmkzoJnnkY3I6lKdnCRRiy17m2hOLfM2+B6leVNm0bKm1
	 attw3qb/stbXM4HslztMaQ4Mwk01xS3OBYTm9B5Nah4QHGHHzcVsxjJqrY6ybOtfwikGC
	 ZK+YSmdlxEX5+isRbqmDsz9kybuHZR43GtMGq0xOLMiKHMsbKHTsxkaK0FhIJ91vvbw7k
	 lbPJm3d8JcYClFl0f0cgPhaWPkZncNSTRMiikcmHFaL4qnnTJ5kJHb+mxjwTvuBWX8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374480;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	b=UdQLmAm4TB/0fbT4l1tMbJi+RENA8azo3C8enG4BjghEFAa8iNl+2Tat79r9kMjYEhI1
	 yGgFzP6eaV5egLfRBQGIIVSoq0hnIx3pZOGy+47le5WXRMy8m0IKFjAs2EOGr8XUv4tgN
	 tjzHVX/pZye9vT4vj/iM36dssCK4pszGDkoyxY7fHsI1fnCys0HDPOKGvO01lJnUchaF7
	 t9X3d2r5kFUxTAP08G285qpZlnY6mrwbnXLzXSrgvuP/+3BAqsD03VShIe7oAB19NDQ/7
	 g8g1Z9BJFsdNfek7Ew8L8idDBORIs813LWK0lgXGUlcRFQG84eAg9yhKiTROcFvbaLg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiacON9O;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34180606A33C;
	Sun, 22 Nov 2026 19:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TiacON9O
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795374479;
	b=gTDVUvEUrzYOorHW1OZ6TEtpgQnQFg72OaV6bxq5KUzagVa7U7g5uq2fu5IrRYONn+Uf
	 i7RZX0ovn7TVKvyqmrVf/Az7dRrbBi7gjkXyk8FWoFvri354CRjunby2yTMpCDalJSTIJ
	 GK7MuEVlqgiHWlTdJbxxEkr2Ql83Jct+IUfeEjTZoF8UhBmimuK9iTllUsVXVTGElyLOd
	 DY3zbee48V2GHlvypIrpnz/OaIAkQF3u2gxRX8woKh3qAxwNnik/5uMSiwAXcrdbHcVPN
	 FRQTQ/Pg2fD1X+tojhqb9HiIAI6dL4mkoGYMjn76ZOELC06FWpD1btB6uUExxHfLnTA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795374479;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	b=qsRQEbzYstt5GcSEe5+Fi83sN+SMnKBmUjfvH6a7KJf+PbjYKPG0WH/a25486UVxDHkl
	 +3QkQnq8SHzBNU7NitazgfeAlbYZVEEXFJlCsjI0EymekcbsLi8ymw597FB0wosEHOF7T
	 q6CYNuF8EqeJ+6LzQ/zDzVsBF0FcCNXs+YsZ1Z4bS51WbjQE4Qzc58SMpRDm/y8kfaGe3
	 9K9yRDlcFjVfU43Z0p09jFpAs26R18ChKT6ZXQd5wOcMVH0pUmCdaDiphT52sEfRDLQc3
	 LnRH7MekFyqPAGGFlADRY6hNx+fd0nhjbXZlzPQ4BH03r6Qh4PiP4IUbIbDlGgYUTWA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CFF991F000C6;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795374479;
	bh=4sD1ZkqiY2GZwKRYH85si4EbEJxtv2x2+CnSHPTE3I0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TiacON9Og9+OwCBZfYDdOzP1GhG87BGE89Qw/g5A0uXJElcZ5Re0Vv4iQmh70dwDG
	 7uU3jauebzlDcyN++Avb+YaPaVVI/8oxwDJ+FniYPFzNoqdwYQUGgyNju1cduY3J/v
	 fp20AgrnD0s6pJ8D3nE1lYolgiEn8LGxBEgtiFfFFI9kvuLgj5q8WbMYk7IgXbGavW
	 5xX6W0nZnKxAdWnL5HMcCC4qBDnguR799NW/AG7ZRzEKy6SGvGzyCtRYNyHuLmm31o
	 uxqGhL0t+sc9hUNP8PQOvLe/IXR4ZUOe7u5M+3AEXdPj/YEHMCAVTrucgA7KhnUJmN
	 aYz3+bOMVXdkg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5CF7F4C1A5;
	Sun, 22 Nov 2026 19:07:48 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 23 Nov 2026 00:37:48 +0530
Subject: [PATCH v4 03/11] dt-bindings: interrupt-controller: qcom,pdc:
 Document Molokai PDC
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-molokai-soc-v4-3-851e5a9f4878@yahoo.com>
References: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
In-Reply-To: <20261123-molokai-soc-v4-0-851e5a9f4878@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795374466; l=994;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=AtXYB47jpEkNJ5+VdRoyyGnPME6veYsNpY8wyZYc4r8=;
 b=N8cGai16oUws18FPwmIvnC7GzRVWLs7P8TcnK0R9BXeTC5ffEx0edLrel4PkS9uFHNq/Woe1Z
 /tudFW20JzuC+8pPEC2KKAI8zlknZb55/aSgsBVv0JU7bU4FzA56+IE
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Document the Power Domain Controller of the Qualcomm Molokai (SM8845) SoC,
which maps one more range of interrupts than the Kaanapali one.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8401d3b48e0f..64de63b7a031 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -33,6 +33,7 @@ properties:
           - qcom,kuno-pdc
           - qcom,maili-pdc
           - qcom,milos-pdc
+          - qcom,molokai-pdc
           - qcom,nord-pdc
           - qcom,qcs615-pdc
           - qcom,qcs8300-pdc

-- 
2.56.1


