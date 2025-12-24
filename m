Received: from mail-4325.protonmail.ch (mail-4325.protonmail.ch [185.70.43.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3132D448;
	Wed, 24 Dec 2025 10:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766571062; cv=none; b=Ctw1fdeDl297K0TIXsb/DgCpwgGKRcia/eEllGEP+eCcuR74XB2923l2CWNzNyGmF/yYxzZRlvyU+EwaovFf4rkxhuTbCAVpB6r1yiwnoAHg0SxqvWHBbD0p5rZ5gxURJRAPeW2Dm1sRoZSO8km93Ba1aztF+flKzX+J11QAkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766571062; c=relaxed/simple;
	bh=opoRu0oShSE9vKmU4/Lbp3lEB5j8hPGGHo/PxJzsPwY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aKqMewtQWexThTvdHLTag4t4ShmVJfjyC197KdkpM2mUsJ4aTvvwUQU0VDgGuA/1iKRgW42vQ3lSUyZdlwjChuTUfUOhMCOjF9Ywc1Ew6UzUhKb1DNGo9/SIeA0TgirYu/GyWWWeTYi6T4O92ILetmRly8zr9aDena8eE84lrTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Kkg9Fi4f; arc=none smtp.client-ip=185.70.43.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Kkg9Fi4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766571052; x=1766830252;
	bh=VfGh99DaHyxuNNcjDG+xthx2dce/rPW4sAfjxa91af0=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Kkg9Fi4fM2KsdpLuiWTu21K4wiHEb6rvP77in2HFWQHzmZMfV2tqRfoyhaxPTpguI
	 caI6wtPmeldY+LFh532HngPY7lxjQkxey+Lun26WnwANF50eJKihDSWzRWhyB4C0B4
	 KQF5755tMSYNEMVsvlueisBrOLikmJQPL50fYgxbQ+1v8y0HnELrNSiU86rUJUiwHv
	 921YIz5XRth62KXzMTk9AidAekbwTDED4n4ax/s7vCyJ1fjIN57FX49SiuosBCNKc3
	 t0h2YMkCoaK/YWnT4XKast6Gstnco4aCfNI1PgXBx5TtwwiwrZxBebNWSnZJUpyOq0
	 SAeFkCSaABPBQ==
Date: Wed, 24 Dec 2025 10:10:48 +0000
To: linux-kernel@vger.kernel.org
From: Raymond Hackley <raymondhackley@protonmail.com>
Cc: Markuss Broks <markuss.broks@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, Raymond Hackley <raymondhackley@protonmail.com>
Subject: [PATCH] dt-bindings: input: touchscreen: imagis: allow linux,keycodes for ist3038
Message-ID: <20251224100941.3356201-1-raymondhackley@protonmail.com>
Feedback-ID: 49437091:user:proton
X-Pm-Message-ID: 20e023c92c0ef6208d6c92209203c9dee83e9a89
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Imagis IST3038 provides touch keys. Allow linux,keycodes for ist3038.

Signed-off-by: Raymond Hackley <raymondhackley@protonmail.com>
---
 .../bindings/input/touchscreen/imagis,ist3038c.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist=
3038c.yaml
index 0ef79343bf9a..dfaffbc398d3 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
+++ b/Documentation/devicetree/bindings/input/touchscreen/imagis,ist3038c.y=
aml
@@ -55,7 +55,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: imagis,ist3032c
+              enum:
+                - imagis,ist3032c
+                - imagis,ist3038
     then:
       properties:
         linux,keycodes: false
--=20
2.47.3


