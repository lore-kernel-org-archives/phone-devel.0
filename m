Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778701F30BB
	for <phone-devel@vger.kernel.org>; Sun, 28 Dec 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766941090; cv=none; b=O6Hnutuz5T6K3SoIO3qhCdx2BF3Pew/ib0fmRwmUfJFr0Jes8UTn9IjvH574O48b+WJUdsg6YIAvzbwO4bWuJTgZ/TVgAq2ES9VqCXX0bCFa1By1fNuibypqTjYfhX1zgJb/hFpF7OtowTYlT2nge09cEZ1//S0nRcqZJGBvxYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766941090; c=relaxed/simple;
	bh=KB9sO9aMGdcw6jeBzLUUFUL9t3v1FpybWsgaytIVZuU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fNwwLKjj/sHqrcJIGh6fxc6DqVqQ/+vggwDg62JmTm5TzZaVnkFQmL2pZAevZeFnxoaXwaDE71cUiYUf/FJoB/VOv2WUIRIBtOXxdMmeEX0nA66i332EbnimBehLpGxcbSBtzKtu6FBwDH41cqNEKMYPWhyzTQcDyZ0Xjmb52CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=t3Nroe30; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="t3Nroe30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1766941080; x=1767200280;
	bh=KB9sO9aMGdcw6jeBzLUUFUL9t3v1FpybWsgaytIVZuU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=t3Nroe30MBaDtpwSsPK+xBqiTNJOmuOzsbSf0kF16dBzD/12IpJ7sgHVTcfyZaBRr
	 PMNWqPEfQ9awyKcnzUD4YBfuKvdm3UiPZrmVvfgwVgRrA6fXcW/xKM7fW2mhePHyoF
	 Mdup8h21Tqn7A4+LKFDojcNEhVGcNPRB4W7KbIzRoCbdm620dIQcU4mBkfEyBEvUy9
	 eFla+Tvrwx4CA08iPkLWaWU05W6oOs8kBdl+JDP+5xK4Ag5vtChCE031DALbPUfNYP
	 OmnTk/DnuJ8xu2mXHTz8AL1ulzO/p3TwDAfpQDYbZikyGrRzBdHpNnyr05a6oSUTh6
	 AGrHBk3DykMoA==
Date: Sun, 28 Dec 2025 16:57:54 +0000
To: "phone-devel@vger.kernel.org" <phone-devel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: Teo En Ming's Review of Vivo X100 Pro Android Phone 29 Dec 2025 Monday
Message-ID: <r5FL-w0olqvxqnChQl2CiLqlD4j9D4oPMxm-RhufGe_9awu-Exk3774X8Onu1HmL5J-rB9GNiYR-rz5gBJvHZBZ_WOhH4GyS8qQYNBQQu7o=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: 2f8bf1e6eccf4cfa7930cc9118e3e04ff28ec782
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: Teo En Ming's Review of Vivo X100 Pro Android Phone 29 Dec 2025 Mo=
nday

Good day from Singapore,

This is based on my personal experience at EOY 2025 cosplay convention at R=
affles City Convention Center Singapore from 27-28 Dec 2025 (Saturday and S=
unday). I have taken more than 1000 photos and videos (with photos being th=
e majority and videos being the minority) with the Vivo X100 Pro Android Ph=
one over these 2 days.

I can conclude that the Vivo X100 Pro Android Phone is an excellent top-of-=
the-line premium flagship smartphone designed for exceptional photography a=
nd videography.

Out of the more than 1000 photos I have taken, very few photos (only 2-3) t=
urn out blur or out of focus.

Front Camera
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I can take selfie photos in rapid firing mode without any lag at all.

Almost all of the selfie photos are sharp and clear with AI beauty enhancem=
ents.

The front camera performs well in low light environment: even when the surr=
oundings are dark, you can still take good quality and well-exposed photos =
without any external light source, thanks to its superior image processor.

Videos taken with the front camera have good quality.

Rear camera
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I can also take portrait photos in rapid firing mode without any lag at all=
.

Almost all of the portrait photos are sharp and clear with AI beauty enhanc=
ements.

The rear camera also performs well in low light environment: even when the =
surroundings are dark, you can still take good quality and well-exposed pho=
tos without any external light source, thanks to its superior image process=
or.

Full HD and 4K videos taken with the rear camera have good quality, even up=
 to 4.3x optical zoom. I have not tried taking 8K videos yet.

However, AI exposure adjustment does not apply to videos taken with the rea=
r camera, so when the surroundings are dark, your recorded videos will also=
 be dark. You will definitely need an external light source (e.g. LED video=
 light) when you take videos with the rear camera.

I think the Vivo X100 Pro Android phone beats my premium super-zoom bridge =
cameras with 1-inch sensors hands down, due to AI beauty enhancements. You =
can definitely use the Vivo X100 Pro Android phone for model portraiture sh=
oots instead of the traditional DSLR and mirrorless cameras.

Thank you for reading my concise review of the Vivo X100 Pro Android Phone.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Extremely Democratic People's Republic of Singapore
29 Dec 2025 Monday 12.57 am Singapore Time









