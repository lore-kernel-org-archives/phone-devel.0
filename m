Received: from mail-24430.protonmail.ch (mail-24430.protonmail.ch [109.224.244.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7032206B5;
	Tue,  8 Jul 2025 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751977317; cv=none; b=drz0DNLulGT/EpJyvc/iEgCjOU4hkUhQGp46QewivFtVKnlRIG3OvsOlj+GgQehGPdDBpDQfntqw37mEpo/nNpxnLr5ON1UGIK3DVT1Rat9OnTtn9wjv/lM5hY/3vmz5Y10MIF6HcJn598fQv/ZG/RWMyFpyj0BTqLtQNP9VEHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751977317; c=relaxed/simple;
	bh=NggV/VQ4gB4OWrQ70ZfEFkYSIKnvnY4qf1kuOMRWzck=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jsPCso93uX2WXsSojqSpInjn0Neif+rJ8b/8cgJdguuvIFwLx2saFtI0Xg5DqgRtginX3ODZCeArqO8/w3Cwr3NbeDgjLmPOEqZWJdMUJ52wJ97Me5Oqduuuqy/+mTk6hBLT1cxiHyigquObCRkzUl3FqJgU7rRiKbkuF915NSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=wr3CC/X3; arc=none smtp.client-ip=109.224.244.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="wr3CC/X3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1751977307; x=1752236507;
	bh=NggV/VQ4gB4OWrQ70ZfEFkYSIKnvnY4qf1kuOMRWzck=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wr3CC/X3ePa5RbxKYApkEfTBWzPRaBEy/u4cccw8b1ITE5kCC3atP1Zvq6cl3pyPy
	 IwiXYNcUv3ms/3HLc7aqnOEY0uFML/z/5iUNKmekqe7Jl8lKaD+jPaLE3Niwk0efCo
	 G0UzutB1vP12x6RzOoq/qvMHeX3Tf32M7Pu24xsizQ6C/rxn9WgkPW0o+RXznaV7kW
	 j9sS5NNp1YIwBhXnLgwcNJzjxVA6hi3n0I4sQeb4EE0QZNcwznv/2NyX9rFH4271rq
	 BTh3mRh+frjQ57WHyB8d8RLVuBdMj+/EPURaX5OfEduPEBbIl2+VNhV/VyPetZvAnG
	 y8ALKUAKeGsAw==
Date: Tue, 08 Jul 2025 12:21:42 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH] ARM: dts: qcom: msm8226-samsung-ms013g: Add touch keys
Message-ID: <20250708122118.157791-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: d749f57c2a305573acdc0957c3a9db5a2d0fef47
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Touch keys feature on Galaxy Grand 2 is provided by Zinitix touchscreen.
Add property linux,keycodes to enable touch keys.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts b/arch/=
arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
index 0c7f07b35ff0..6f5be32942d3 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dts
@@ -173,6 +173,8 @@ touchscreen@20 {
=20
 =09=09pinctrl-0 =3D <&tsp_int_default>;
 =09=09pinctrl-names =3D "default";
+
+=09=09linux,keycodes =3D <KEY_APPSELECT KEY_BACK>;
 =09};
 };
=20
--=20
2.39.5


