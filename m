Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF6E1876
	for <phone-devel@vger.kernel.org>; Fri, 28 Jun 2024 17:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719596708; cv=none; b=o6WLzq4eqgj+dtoMqyIZTwjSba2gAMUt5OisFVNM4qDHc6aThEhBvq/N/mBEydPtsOkH0+gL3v4ai0QiXBsb3TrTYjpPb3VbdN/y9n3FIWQLUJ41RPYHI1Vc2+z4Qw+ZbhE1esLRE9MxKkDH87S/L9DtNGqLMtWSQg7wQtLk9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719596708; c=relaxed/simple;
	bh=NbOS8wtvU7uKZD7BIvMjlCuVnUcuWUyNlr4dVg1GJ5w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:To:From:
	 References:In-Reply-To; b=mUkCwNwD4OFM/QxI42Hn0ZoMdariT68EgFWrqgwWnX7l+4Q91QfKgKAxy0TPgCeyjG8IA1XdzzHmbuoGJmzeS5ATI5aUYrKKUTLEgi4btfRA65ox9y5IdhyxwXoDRzLJPTblFAJ/sZmZ7cByxHHrA0GBJhAK0YBJ5zfSfsk14os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=kbMcgn20; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="kbMcgn20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1719595214; x=1720895214;
	bh=NbOS8wtvU7uKZD7BIvMjlCuVnUcuWUyNlr4dVg1GJ5w=; h=From;
	b=kbMcgn20SSqY+/JxddiLXwHe9sRBJ9BKqp4uHpNCQLh5PZrbZvIQO1XMKrGNPI2PT
	 HpY0OkPKM4Ui8kXeCfb1+coH564dkDDw6PkYgz6EkKrSWIh1TNtu9LryK4YUuzb1a4
	 9LBh6/yHSWk+3RqJjtVf8iafrA4dSQFqerg7nD5eRfhMJbbfswm9us0YK7jrzY5dlr
	 bZCM6C6Vv+kGGfBI5WA+olaLCjIVuoFMEfSoQkxuhkagIsOwjZGbqg8kOklomUq0OP
	 3My/2ZHjF+yi2Nc1qL7dRtCXCFihkSLm6X8xKW9kyfOF/iD0nyhI2XMioUWg1En8Md
	 u7jQLsnSNXIfA==
Received: from localhost (cdwifi-a110.cd-t.cz [213.235.133.110] (may be forged))
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 45SHKBZq057515
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 28 Jun 2024 19:20:13 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Jun 2024 19:20:50 +0200
Message-Id: <D2BTN4CHSFO0.1H59EH2PH7HAG@matfyz.cz>
Cc: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v7 0/5] initial support for Marvell 88PM886 PMIC
To: "Lee Jones" <lee@kernel.org>, "Rob Herring" <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor Dooley"
 <conor+dt@kernel.org>,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>,
        "Liam
 Girdwood" <lgirdwood@gmail.com>,
        "Mark Brown" <broonie@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-input@vger.kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20240531175109.15599-1-balejk@matfyz.cz>
 <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>
In-Reply-To: <171958569931.3316488.12728822093231549974.b4-ty@kernel.org>

Lee Jones, 2024-06-28T15:41:39+01:00:
> On Fri, 31 May 2024 19:34:55 +0200, Karel Balej wrote:
> > the following implements basic support for Marvell's 88PM886 PMIC which
> > is found for instance as a component of the samsung,coreprimevelte
> > smartphone which inspired this and also serves as a testing platform.
> >=20
> > The code for the MFD is based primarily on this old series [1] with the
> > addition of poweroff based on the smartphone's downstream kernel tree
> > [2]. The onkey and regulators drivers are based on the latter. I am not
> > in possesion of the datasheet.
> >=20
> > [...]
>
> Applied, thanks!

Thank you and thank you and everybody else for all the feedback and
reviews, I appreciate it.

K. B.
