Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795189997;
	b=oegsY4/cLEd21KNimsQfoOiA0F9VYGa4uaP4VmCsVavZnnu0lt2Imt8+g1G3IQii2vPK
	 YM5Vw+zXGA7/hokqZck4Pw7o0b04LMC/h40KnG/7Vq+V+eT87B71423qH9LGFn0+qkSj3
	 zQWVs7uM2FRRGkshDuhZrp++ge8ZNxTewpYN8djx78tnAexIlfDrHEQ9fNcxWphRUYvuR
	 4J7w7ZpKA/Z/6UUFkb0YCktWv8bcwPDC71wtXuBD1CZoAFOElt7d6qdHq0/MEmHq4GTKA
	 qkAPywibJlNmyR0A4j8fonflzMIFdhRUrvSqJwGsnrdldY3fMjjHBfn6uJU0LQ7Ba1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795189997;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6GxIMMOl6OT3BgP5yi9+28ovIws7tUAb4j0+aTl65xk=;
	b=go1HU3MKpCrUtf4UTDS9yTtsJ3ChqwwsuIs4fxDDdSd5i9l1C/iYcz0ukvCzSOCpr+4+
	 GMu9jOF5A+0xrgI6zOzCouhE0ucKrfIol5SaQvgv3hCpp6bYt0wk40i0CFKDPpKxQUIv6
	 EVA0R2txL4SHxdNLGgMfTobNGntiT6XLxHp7VU0rhqrcj+I95+593K7DqgVzi+Cd+QowV
	 +8WAd0t03//XyuWhMueWG9Q/6mH0u/IT562qXHxmJAlEVkhKlcQ8Qxo6WptKREGHvuH/O
	 AR46dffbI+ZFn094+6OWzNwUS7JOUsuDKAQNnDSK8SGri7r+TkJ2moicGrNHXmgQRhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="I3d/r8iQ";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AC1606A33E;
	Fri, 20 Nov 2026 15:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I3d/r8iQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795189996;
	b=L6C8/cdY9/vdu8h7tEmY0/W0vPDHX9BxL5DinFQnRjWr+jLdSVe72x/B2SAEUWfIACUC
	 b04mfEaiIToTMFBeLmgywaObGgID8Uhp/Nh5uUfWArBO5laVaIgBdG4h7PYNYNd4V4c6i
	 IozrPuxQSxiGOiptkfsRRT+zE0Knhso7xixyvmcFAhj74nrBLgnScTZytFgfv+vSLNDOa
	 i+Odq0uiWI/+61VJV+DZVM3A4lxGcIvtqsxeQkX3nSW0lqOxtcg8G0XgJKFWHWTPgCnky
	 szizyw80bAl4ySOIYBL0+UnQGzlcPbzr4YUNTCjKqcBW6Xe6jyQoptiTitGvtViExjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795189996;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6GxIMMOl6OT3BgP5yi9+28ovIws7tUAb4j0+aTl65xk=;
	b=sJWhAso/kl1OW3im73tOu1HFJwA+MyXfA60eTLIwbsP+sWGniXAPgCQPW7nQgrzPobW6
	 KsMc/7qgclSekcIL9iwWxbGZ8+77cTsfGwnBXdccOAVhld3EePI2ir37JwXncSsYx8WOk
	 R70U2rdUoCM/UbEEdKP3h1zEHBMHhgJHwsFF0FPbE0IX26PThrtzokduopYLYlx4zcQiu
	 CwmABOxta8HuUTxiLAY1On4h9b2UomiOAxbZYRkFEkmRugP7O9ens7ZvU5oElzVZF72iG
	 NWkKIPecHY4jYGvFDVZQf3BYyuk710kejmmy/ZwGEpxYXOO4VpvYQL4WKeziqb9MsHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BDF61F00A3C;
	Fri, 20 Nov 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795189996;
	bh=6GxIMMOl6OT3BgP5yi9+28ovIws7tUAb4j0+aTl65xk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=I3d/r8iQWUoAddGOSutWRUnkddqijh5r09+PecDW544LGo585pV4TIgnwrHsNE/Vf
	 rvzhKgcedx7y0M5PyBflT1W4s2mweqybHgec0BJ4DuvKAr7Hyai5lSGdKomhxWmxM2
	 zGE8rzqsm1JqfwQ3Khuqumurj5fqvgH4vjHDBb8WbP1BT+QezeUDTvjX7a8MBdMPMO
	 5hcRUQ/hjfmL97vBmM3ZLhVEIQeaAqBjHOop3zqFy4/b31UkaQeJn49c2nOKL2Xo2y
	 +wltaB3PGn5U81MYUTaX+ztzYFeg8XlPs44QCJcaHjGiO8AOc67Xdiz/rGrg5cK+6p
	 l3/Ep4fdm3Zew==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B18AA4991F;
	Fri, 20 Nov 2026 15:53:04 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Fri, 20 Nov 2026 21:23:03 +0530
Subject: [PATCH v3 01/11] dt-bindings: arm: qcom,ids: Add SoC ID for SM8845
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
Message-Id: <20261120-molokai-soc-v3-1-403d763685d9@yahoo.com>
References: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
In-Reply-To: <20261120-molokai-soc-v3-0-403d763685d9@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795189983; l=789;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=itNkOBsn5zBXIqWfZ31vPjkOQIWmU2w3sGj2sszfkTE=;
 b=tDORZz76Q7I2nv9Eap1OWBYBdurn8FBNZgsHXeQzj8N5Dc8hGmkT1JyTRApmS1gPWCAcN5wOg
 +CvgxWdD8aMBv2r79JFQkFmW2pYBe8fQ6Pe5UP2HwuluO/sKNuB2j+u
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the ID of the Qualcomm SM8845 (Molokai), a variant of the SM8850
(Kaanapali), as the Motorola Signature reports it in SMEM. socinfo uses
it to report the SoC by name.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index d89d3b5dd00c..5e4af9edcd77 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -300,6 +300,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SM8845			685
 #define QCOM_ID_SA8797P			690
 #define QCOM_ID_SM8975			707
 #define QCOM_ID_CQ7790M			731

-- 
2.56.1


