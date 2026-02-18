Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73265220F2D
	for <phone-devel@vger.kernel.org>; Wed, 18 Feb 2026 00:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771373956; cv=none; b=AVPH4AG10rbtr+r+YvcrTJxhwkWK4UwURU4Q+H2sNtbwBRf+DJ8JnTla9pd6TJyzKCShAW8HVfrrj2LPaGQt4BwYl6b2r4DRiGuLTLmH52g0VMzan86cLhpja3b4THk6xrZHBUDq6yUoNPGtphfHyanL4ngQo/dSrpc8Q0gIl8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771373956; c=relaxed/simple;
	bh=iWxz9hS/cM6IsGj2Xnd4oK5lyC5JkpNLPaBzkWaWQ8I=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=YHeBmyT1Nllzz8szJuqKHM0iuGkZmQA73vxS8CVCiWAsFUuZabzoU6Als8Ox21PSHG3474FgPdXnaadUc/ca2qetf/jgGO4rnJZ+YdztcieBafSNsRR21Tp2+jpO+GHmav9+/ColJHvfJzLHpTBD0T9uvpK+wz1Xt1oMOyBiGRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=YE6685Qw; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="YE6685Qw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1771373952; x=1771633152;
	bh=iWxz9hS/cM6IsGj2Xnd4oK5lyC5JkpNLPaBzkWaWQ8I=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YE6685QwrcpakCk6DlcdcjMH4BCqP5AF7VMN8P2aT+pMZ0An3dwmkWfsz90YalVUQ
	 jg0EWjOerEQUL2Bat+rcIPgifHP8hDxl75yAOvmeQUP2fqbXvK14ou7URqdy/QcYn7
	 f8iXcXerXLT65UeLG6TL6N5QTBjLF6Iw0ADNsIzQ9m1rdLNTSfjm8Hx2ZKExp16Amp
	 MUDXHE0NClhxKChbxEIIl54dZS8s47e5mc5ZrnHFB3X3KTlJh47hAVc/K+NNpomKUn
	 Ny65iPzIktC4TV5xXc0/y75he9vfRNxM6rdcJVH7X/5usoVGTbxUbcnZbWB24KZPtc
	 OkwD9XsGh/zWQ==
Date: Wed, 18 Feb 2026 00:19:09 +0000
To: aelin@mainlining.org
From: Alexander Koskovich <AKoskovich@pm.me>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, hansg@kernel.org, krzk+dt@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux@mainlining.org, neil.armstrong@linaro.org, pc1598@mainlining.org, phone-devel@vger.kernel.org, robh@kernel.org, rydberg@bitmath.org, ~postmarketos/upstreaming@lists.sr.ht, Alexander Koskovich <AKoskovich@pm.me>
Subject: Re: [PATCH 2/3] Input: add support for Goodix GTX8 Touchscreen ICs
Message-ID: <20260218001846.59363-1-akoskovich@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 5c2b87d16bcf39f8e5301048801b39030f04b267
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Validated on the ASUS ROG Phone 3 (GT9896).

Tested-by: Alexander Koskovich <AKoskovich@pm.me>

