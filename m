Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129661E5B64;
	Sun,  1 Mar 2026 15:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772380637; cv=none; b=eZHBVOZSHTycgTIUpy1GaCcNA0EoY0UvpRGMyYbnVX6H2UVIUaoWkmDkhwyWNTwQxvADN92qlEIaGQ0YMdvhJDuey4nvjo71cb0/A7Gu32A92wC6hUZpGh9pc1mPDmR9A2mCwdJ1uTfVCA8NgD9K+TQjxZtVefSVirGxYt8On1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772380637; c=relaxed/simple;
	bh=t8oc8JDt2e608x3X8ZqaFFb/ngOLHac77ZTqYBbzizI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yn5dq6pl8FpzEnR4YMqLlTJPrz0xFPiWIJLP1iYPyicIWSu/1kjVC7MToPez/jyHIsx1+t9aytlOjJzkWxUzr7Z4gfiDtk5DV1IritYjzXpS56Vq0vVumIyYjb55En+ZNw9bIsTiRKow4vmfsbkiOnfrnhwcjpwEirc08wkZYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=bVXOpCa4; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=XRBflLCK; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="bVXOpCa4";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="XRBflLCK"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772380518; bh=nbcD0sgt3M7NkjfYuNxSnj+
	7YeOQ1n3E7X8hZDizAqk=; b=bVXOpCa4Qi1nCkLX9dhYHcNz3h5nRoUmPc7qSn8ydD7nyRpEQs
	PsCqvPcm0Nagk5d16d5qlVl/dPUZJCvxJ0ncjdSAJeavbaxNt6TnJLT/sUKzKlg3K2ytBHp5dKB
	CYSeA3sk46/RoARU6njkBxW6T8nWrJ++rOxLuiw8ZrfKAxWi87atFUXZptZ1l1dZ+Rjn6KuqjCA
	kaav9jkxstx0Ptg/kThoE/gQibh+ijFpzeD5IFKhBN4ljEvL6gVsQwDgEIz9SdT8Ra6H6+22wEV
	zjll8VGMj+9rLS2BRkHsKfOrz4EGYb6aghQSuhN04dDi6O38TX4IkF7Nv1Az6aMQ6ig==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772380518; bh=nbcD0sgt3M7NkjfYuNxSnj+
	7YeOQ1n3E7X8hZDizAqk=; b=XRBflLCKKtyu2lMDMWw6tFbapGlTqxm5FKWkvBpg14lLF5qg7M
	VB5WuA87x4h9+5ggBVSjGYJKFyS3WJEXI0DA==;
From: Aelin Reidel <aelin@mainlining.org>
Date: Sun, 01 Mar 2026 16:55:10 +0100
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC IDs for SM7450 and
 SM7450P
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-fillmore-socids-v1-1-5a033cd8d0e3@mainlining.org>
References: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
In-Reply-To: <20260301-fillmore-socids-v1-0-5a033cd8d0e3@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux@mainlining.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Aelin Reidel <aelin@mainlining.org>
X-Mailer: b4 0.14.2

SM7450 and SM7450P are two SoCs of the 'fillmore' family.

Signed-off-by: Aelin Reidel <aelin@mainlining.org>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 8776844e0eeb370b874f41063ba057d5ade4f003..4efbf06fad9c9bd3ca33910d48dd3b9574271e5f 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -245,6 +245,7 @@
 #define QCOM_ID_IPQ5000			503
 #define QCOM_ID_IPQ0509			504
 #define QCOM_ID_IPQ0518			505
+#define QCOM_ID_SM7450			506
 #define QCOM_ID_SM6375			507
 #define QCOM_ID_IPQ9514			510
 #define QCOM_ID_IPQ9550			511
@@ -264,6 +265,7 @@
 #define QCOM_ID_QRU1000			539
 #define QCOM_ID_SM8475_2		540
 #define QCOM_ID_QDU1000			545
+#define QCOM_ID_SM7450P			547
 #define QCOM_ID_X1E80100		555
 #define QCOM_ID_SM8650			557
 #define QCOM_ID_SM4450			568

-- 
2.53.0

