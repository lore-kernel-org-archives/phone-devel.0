Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC902283CAF;
	Mon,  1 Jun 2026 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329972; cv=none; b=DTNqzyM3Vh4TSgO+Ygo9d1OsyZAKiyQ8VUNpkextAA7EuDWirNQMKAfMrPLeaa0w+Ap4f3IY7d2H9oGeAZ/eS0FTqcfhYKpX2AwVZxpxbk+4ndbl2OAa1D8mf8WEoN+AZdznzkiufDKwC+bMedaaZAdHWASr1TAgGM/EtYBvGWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329972; c=relaxed/simple;
	bh=/3rNSSceNL2wCo52RJwTdih5C1kJmAMlheUO18wFuW8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bZqTmF/8WBflONpK+mWUAxpjPFG7KGCpODxYO78Tgp0eBsUGfaiXOaJQChcvgqWjfmhvGTFYEn3pnDmUJ0hztRobYjPM7IfL5FBMMSLcTIlDxFpOjYBGAniIv7iTf/EgkjcfmD0db2Pgm8EIm4923YAsCO9vyG7mPZ9oiKHbS80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=eKENZMs8; arc=none smtp.client-ip=185.70.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="eKENZMs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1780329967; x=1780589167;
	bh=UzDD1WGN+WmDKcizcrpIA/6lsYmnSFIs7OphgE5XXDM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=eKENZMs8I7AYcRgphto1zv6Z5jzepcsGmZMhMhPDocsJbs3d8NtOWq4YnXAuDQK7X
	 fr5bYlf3XcKD/EAqo3kq4bCAuH+GDpnRoD6vWxNVk7r+CF5+ijZMlQRAyxwABg6aZ7
	 s2J6xMDDdd7D1W7ff+Yuww9zwZfEzosTr9hOGBKFIJSF+GW/hCIcu+9cqaXh9qNESv
	 u5RsKMsku+9eAX+AiQIrJ8TiGv3bquqs94dumcllhNH8OswNezNJ2KS6i5SU7OpSNI
	 1665fOMbZkLBBT9wlYQ8ly6pZFkY+BMn5fOC44nXW17W40JWITrrCKTOJ0uVZYqL1a
	 fZ8RiI5rsJ8lw==
Date: Mon, 01 Jun 2026 16:06:02 +0000
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 9/9] media: qcom: camss: Enable C-PHY where available
Message-ID: <c79292f0-4ce1-432d-bbf0-803780d74002@nxsw.ie>
In-Reply-To: <20260531-qcom-cphy-v5-9-6be0f62b4d65@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz> <20260531-qcom-cphy-v5-9-6be0f62b4d65@ixit.cz>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 60138d82d18641374c3fcd9c4641261d92de9260
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 31/05/2026 14:08, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> After all the changes done we can now safely enable C-PHY for a SoC
> where it's available.
>=20
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index db4e14a84a95f..555c53343a1e9 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4761,21 +4761,21 @@ static int camss_parse_endpoint_node(struct devic=
e *dev,
>   =09struct v4l2_fwnode_endpoint vep =3D { { 0 } };
>   =09unsigned int i;
>   =09int ret;
>=20
>   =09ret =3D v4l2_fwnode_endpoint_parse(ep, &vep);
>   =09if (ret)
>   =09=09return ret;
>=20
> -=09/*
> -=09 * Most SoCs support both D-PHY and C-PHY standards, but currently on=
ly
> -=09 * D-PHY is supported in the driver.
> -=09 */
> -=09if (vep.bus_type !=3D V4L2_MBUS_CSI2_DPHY) {
> +=09switch (vep.bus_type) {
> +=09case V4L2_MBUS_CSI2_CPHY:
> +=09case V4L2_MBUS_CSI2_DPHY:
> +=09=09break;
> +=09default:
>   =09=09dev_err(dev, "Unsupported bus type %d\n", vep.bus_type);
>   =09=09return -EINVAL;
>   =09}
>=20
>   =09csd->interface.csiphy_id =3D vep.base.port;
>=20
>   =09mipi_csi2 =3D &vep.bus.mipi_csi2;
>   =09lncfg->num_data =3D mipi_csi2->num_data_lanes;
>=20
> --
> 2.53.0
>=20
>=20
>=20


Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

