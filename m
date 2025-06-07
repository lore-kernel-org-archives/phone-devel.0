Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1F01E2853
	for <phone-devel@vger.kernel.org>; Sat,  7 Jun 2025 11:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749296959; cv=none; b=uQItWohAqWL/IEPLt2sB/tRaJosyGeNQCSb76vMj9BrqzXXeE9roYMfCaAp9qck3GgYBPwzNqkINj863+bwfR9TGplNcgYQ3Hr31g37Hs1j3k+vgn4nZ8bO8Fn9xkmGVpVD2P5NEVNoKw+ZEiNeWhBBej4pqCYIfAYxvEaIeyqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749296959; c=relaxed/simple;
	bh=/T08KDW+Tj9C/4GGTQC6sqTnPRLwiu7FDcAJE7E1hi4=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FcOIme9juHUpFRcuaawmyjGT2Wy6xmLhj5O0zz4DMVXhnX8UkdD3SNkMB/2KOAfuLigkAfEyKEEjDRR8+L1VG85LLWbTyv6jqMZHZsE1NYIcr1bDBMLuCoqVH/3+gMrll6zbG6vrWwnsQDFjROAr5PM5fuhGkkqCXk9WJOzqXZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=YiVqr0i1; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="YiVqr0i1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1749296949; x=1749556149;
	bh=/T08KDW+Tj9C/4GGTQC6sqTnPRLwiu7FDcAJE7E1hi4=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=YiVqr0i1EZhYZCDqDSe4C/Hztbax393ybp83y9Erbx3cihGGSofrGM5GDAwmAI5Ei
	 KEPJmfMWNdxUkkV/9adR5P0tscJbEajLRNg61h7ryBFwaksgsn9Tp5iIa4ovLmiXbA
	 gO6C002W9gvyDxlyxsh/G00UBR2ItNBghs+qkT5spLScDxIkN7TruySE5HIsgNUz35
	 YLoMKDYzYCjyKR/2g09FJJpPKDKh4Vdcr3jOS9hQWKoJuyF96n9oPAIJCB+c2FzhE2
	 s2zzC0lnxSZKAiF2MijLksHtR4+9VERGiICtaNbQgAZ7kkBm0Db2oQ0nWa0O96/I7c
	 Am4WQ/QF148hA==
Date: Sat, 07 Jun 2025 11:48:58 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Simple Gallery Pro gallery / album app for Oppo Reno10 Pro 5G Android Phone
Message-ID: <6_w3DBps2Qx1_6293aTjmQkZQRvPZudDo9lH8_5wic_fgZNu88aCAZuFlBpawomHhk1DgZ9sCbG4PEGCxVjIBFiLPf7sX1Rj1f9H4qNMUkE=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 6219ca9d3c636f4c35a511750fac332521659336
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Simple Gallery Pro gallery / album app for Oppo Reno10 Pro 5G Andr=
oid Phone

Good day from Singapore,

Developer email: hello@simplemobiletools.com

Version 6.28.1 Pro

Made in Slovakia

App Settings
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Manage included folders
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

/storage/emulated/0/DCIM/Camera

Manage excluded folders
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

/storage/emulated/0/Download

/storage/emulated/0/Android/media/org.telegram.messenger

/storage/emulated/0/DCIM/MyAlbums

/storage/emulated/0/Pictures

/storage/emulated/0/Android/media/com.whatsapp

Oppo Photos is the stock gallery / album app for Oppo Reno10 Pro 5G Android=
 phone.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals in Singapore
GIMP =3D Government-Induced Medical Problems
7 June 2025 Saturday 7.32 PM Singapore Time




