Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6414734FE
	for <phone-devel@vger.kernel.org>; Fri, 24 Jul 2026 23:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784934785; cv=none; b=F2yEwy8QvnXJvtWLHqm2waPkprwmlkHTQkpH7yCYLinVrEF5vcqg/hgA8BB7cbKPNDRyGNn0+nzhloYNqJ4sOFO/fAEaY6EUw9RWMWVuhzhCtVnBmjEB5OC6/WRPl/rb2F+X0YYIYcrHyMIleibJLZPjJ7k7DtUmsxZj4STE3ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784934785; c=relaxed/simple;
	bh=ZcMetcRCMhpyEKaaMwCmYq1ySW2wlImESQd96oeuKwI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DbI36v1KuUa4oR2Gddj/PBeaG5gBXOUq+s1SWcIR0tNMNE+39hyNTt+nlNTXUsuFUKifHccVtZuwR1YDyvMsRSzpIS7TLn+dPqJ7cIA+8r2CPxp4YIyHDt23dmUq5BsQPgLqzHEq6mvYJCeSYle0MTRzNgLtJQGxzzSBVyNIweo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=fAktlbiq; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="fAktlbiq"
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1784934770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZcMetcRCMhpyEKaaMwCmYq1ySW2wlImESQd96oeuKwI=;
	b=fAktlbiqu6vf9JcuoiXmpAENEcpDBYo/jkiEiDYZ1EDVRNl/5qjuNpxw4I52qH8knfa1AB
	AE/v4RXWMfYBJnhip7u25I6TlSommAOjZfuH1Pjj02XS9lCEj3b/pHo1h16v4TVkaIb9mL
	gq8lniBzuzXj99AQmSTdjxXbRb+Hs+vLn01zDkJKAGsTCkJI9EVhIoMyBK0phYzxZRNdbB
	djjsNs+8WiwCAEhTIQr5YzqZWzS50PsXqAnb8bRMrrfUjdYvoxlbzD96fbSggcf5QSFJZQ
	ER04LPUUJm+T5ZMVYEnbEr/d+pQa4wYtjx6jYPZd2a4OG/RRf/ZCrhNiVT/hvw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 16:12:45 -0700
Message-Id: <DK76KF9XU8YL.19M1BK57CQRPK@postmarketos.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH] ASoC: soc-core: use the device tree card name as
 long_name
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Clayton Craft" <craftyguy@postmarketos.org>
To: "Val Packett" <val@packett.cool>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>
References: <20260506041112.412871-2-val@packett.cool>
In-Reply-To: <20260506041112.412871-2-val@packett.cool>
X-Migadu-Flow: FLOW_OUT

On Tue May 5, 2026 at 8:58 PM PDT, Val Packett wrote:
> When setting the model property for the sound card on an OF/DT system,
> the expectation is that that model name would be used in the UCM config
> path lookup. However, the DT model name was only used as the "short"
> name, which gets overriden by the "long" name during loading, and
> the "long" name is automatically set based on DMI data if available.
> As a result, adding an intermediate bootloader such as U-Boot which
> provides DMI data on a device that didn't have it before would break
> the UCM config loading by suddenly looking at the "wrong" path.
>
> Fix by assigning the DT model name to the long_name field as well.
>
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Thanks for the patch! This fixed audio on my Google Pixel 3a, which booted =
the
7.1.3 kernel (on postmarketOS) via u-boot.

-Clayton

Tested-by: Clayton Craft <craftyguy@postmarketos.org>
