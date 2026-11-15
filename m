Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.75.76.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743085;
	b=S7R0e8s44JsQXOGp890XEcG7/KprkfzWcRJ6OeQl1wi30bqHbq2SZ9LxuHQSyMj4Oxw8
	 BnFBcNJH1wBE+cprtsRpMrPvGfhm4t0HFgmeHdumMQx/8Fr9dMj+KmerNQd00IdN/KQe2
	 ECPqE2lqAsDAcewDlBQk0NDpUfmTeOkAMLiqxD7RvjCAImIPo6/Kg2NEw5QGfC0u7zXMW
	 pI6lAXU0ZaHzUCFO+ckyFIe1V7lypnJL9HrRYupC9pIBt5adp2tA1EnjhSemyc+JiFvT7
	 0LTN/E5pbpE18DGoX5G3Sn1rzLbgB+EFI+DgyYK9q6LCoppNiqrJvGw3YNk+ZBcLxcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-Id:References:In-Reply-To:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	bh=PoYGPxB2i0uKWFraLX5C0mUL7s/KPNhZ0wsY+qncz/4=;
	b=JGz4lliwnmUmSal6A6LrIrh951U6l4VVcx7q2sxo0tofN+J+wtZWN7Gmtdiyyone5bCb
	 edYNY/4FcAuVi4wPVRBAsUjpv5m3KZGszHxKxcyIuOd/G2dpMIBfxEq2i9ut+gCzd7XPZ
	 hIsAT4mNWPpEPcjnVe2Lj2Ovz5qx8MTV3u9Nt4Gdc6AmjhP1Ok9hhfQRjjn3GAslkTnsG
	 ZXke1KFQXHdxq+0wGYAyjNI4VbrJQxEkz+WUqGvsr95p5V9+DTSS2WlvxBaUS1Kt5Tazd
	 UgglJ3w4LhHqHDHHIjgOFro/PfX86bzbmKo7s5/xAYdvY2lr2Yry9RuktMamzfzPBHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=email.cz;
	spf=pass smtp.mailfrom=email.cz;
	dkim=pass header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=II6YJ4R9;
	arc=none smtp.remote-ip=77.75.76.34
Received: from mxe.seznam.cz (mxe.seznam.cz [77.75.76.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF74606A31D;
	Sun, 15 Nov 2026 11:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DF74606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=email.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=email.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=email.cz header.i=@email.cz header.a=rsa-sha256 header.s=szn1 header.b=II6YJ4R9
Received: from email.seznam.cz
	by smtpc-mxe-5988798c85-lmdnl
	(smtpc-mxe-5988798c85-lmdnl [2a02:598:128:8a00::1000:ab7])
	id 29bef5e7d74a474d29307bff;
	Sun, 15 Nov 2026 12:43:54 +0100 (CET)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz; s=szn1;
	t=1794743034; bh=PoYGPxB2i0uKWFraLX5C0mUL7s/KPNhZ0wsY+qncz/4=;
	h=From:To:Cc:Subject:Date:Message-Id:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=II6YJ4R9ZokmVQ1tRWD2X0i2k5GpluL17iiE92nMZHm35/4amQBFrZoXFUIHCtqah
	 hdJCukyZjtTNr76GW/CJTgr9sBsIJKJaTUTl9RL55VIoeghgKAGuuVvHJHFNSrEChZ
	 yKFa2zFySWE973WDrVkTv3z4JI+86bW1gzb3QSCyNqe077GUFMqwksMUDjOKFCoNxp
	 oir8/RKqC/R5vqtwvDtt+x3PR8XC9Mg8K8RW0kA2myVariLgnm1+MrlpANdkLVjI6r
	 1x5QNRLL3r+RHtwkYEXukCM4JNry5ifDCjtdO34KzQDDlJbh2F1IlzLQB6d+drWjsd
	 OoTRsMu++EjLg==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-email-ebox-5.1.30) with HTTP;
	Sun, 15 Nov 2026 12:43:44 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "David Heidelberg" <david@ixit.cz>
Cc: <linux-wireless@vger.kernel.org>,
	<ath10k@lists.infradead.org>,
	"phone-devel" <phone-devel@vger.kernel.org>,
	"Felix Kaechele" <felix@kaechele.ca>,
	<jjohnson@kernel.org>
Subject: =?utf-8?q?Re=3A_=5BPATCH_ath-next_1/6=5D_wifi=3A_ath10k=3A_usb=3A?=
	=?utf-8?q?_fix_group_key_installation?=
Date: Sun, 15 Nov 2026 12:43:44 +0100 (CET)
Message-Id: <5Nd.ZqDG.68CtbqKyNmY.1g{Phm@seznam.cz>
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
	<20261114090737.64348-2-tomaspaukrt@email.cz>
	<7e36cb20-7752-4778-b068-56d41819f670@kaechele.ca>
	<dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
In-Reply-To: <dfae62c8-6fd0-40da-bc4c-65d4d6594cd0@ixit.cz>
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (szn-mime-2.2.19)
X-Mailer: szn-email-ebox-5.1.30
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Hello.
>
> I'm pretty sure it's not related to the USB bus, but related to the devi=
ce firmware.
>
> Check what firmware you use, add the `.no_pairwise_key_del_ind =3D true`=
 and 
> report if that solves your issue, I'm happy to send v2 with your usecase=
 covered.
>
> David
>
> P.S. Felix, thanks for Ccing me here :)

Hi David and Felix,

I tested David's patch with .no_pairwise_key_del_ind =3D true on QCA9377-7=

against my patch, 30 minutes of disconnect/reconnect cycles each.

You are right that the firmware sends no HTT security indication for
the pairwise key removal, and David's patch fixes that part here too.

But QCA9377-7 has a second problem: the indication for the group key
installation comes late, from 47 ms up to 4 s. With David's patch 64
of 184 group key installations (35%) still timed out and mac80211
deauthenticated.

WMI_VDEV_INSTALL_KEY_COMPLETE_EVENTID arrives within 1 ms for every
installation and removal. Completing install_key_done on it gave no
timeout in 211 connections.

So David's patch alone does not fix QCA9377-7. I agree the issue is
not USB specific. Without the bus check, the wait would be completed
on the WMI event for all WMI-TLV targets. Could you check if my patch
without the bus check also works on WCN3990 and QCA9379 SDIO?

Thanks

Tomas
