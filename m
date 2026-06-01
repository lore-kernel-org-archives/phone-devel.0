Received: from mail-4320.protonmail.ch (mail-4320.protonmail.ch [185.70.43.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241E539D3EB;
	Mon,  1 Jun 2026 15:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329589; cv=none; b=HvsuOeyBki1RyNd/HjgVWtTZ03gD2GOssIfMaCHibtwg02+amct7L3a0V3fjkC2H1s0Y+tGLYVrKpNetmzC6zDEP3PI5FSOtjyjYh0L1HchMELFggE42pcHvAundd8vVVnRDXzfC4DtswAOFzEDX2fmJZEuOPy0WflfbKmZ7GN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329589; c=relaxed/simple;
	bh=siznxTogCHKxXst8Lq3mDvd8C0H+AogSWhZU4jMP48M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ORKdnKNcwzv+EYwSyravHgjcgtykGO8zujqKBJS6rxyRIoSXQshxFHQSePiekZnft7bLGY4q+HLip/X3BmZ8OPaie5lYggAU0QZIAqqobO5WqCTWuzZxv5pp3zWw9DkK0ECixfQ62nO/XJmoXy5kHRUo7qPHCdMDaEM+hl1JZqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie; spf=pass smtp.mailfrom=nxsw.ie; dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b=RBS5nRPS; arc=none smtp.client-ip=185.70.43.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxsw.ie header.i=@nxsw.ie header.b="RBS5nRPS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail; t=1780329579; x=1780588779;
	bh=kHfLwfneoa+Js6ej14JnZpESus7RpKq9V3awMa89nvM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RBS5nRPSZr/+6jKQvnWr9IT+Tioqwh2T5AlgkuF3lzXuUoJAF4l+HPTTD7RIgb7YG
	 d06RP5t+nPnWYHC3nGKziOz62Y2/vAGGo9D0nZm8OwqAwS5qrAr8RxrEE/DE+WUpL3
	 SOosXuf1QrG9wkAytLoBKuKTBkAO94saoekQmw9dufUF3GZxTys4YH2CDfAAf5M4A5
	 N1yKqjmo7Yo4v1ujHJkmBzyIFlLrDSWTjYLFAQ2o/HqiN7xl9aeqMHXI7IgMb6nnAG
	 funORKctFE6wEySMmeSwleeFoybTxLBqy/CWszWEhXezXVzRbvPyylINUjjhbTTIis
	 P1SDjdPgkKA6A==
Date: Mon, 01 Jun 2026 15:59:32 +0000
To: David Heidelberg <david@ixit.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>, Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Joel Selvaraj <foss@joelselvaraj.com>, Kieran Bingham <kbingham@kernel.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH WIP v5 2/9] media: qcom: camss: csiphy-3ph: Use odd bits for configuring C-PHY lanes
Message-ID: <6503e8e2-5d7e-4875-a855-2e9a4526677e@nxsw.ie>
In-Reply-To: <c8cda422-1a02-4a2d-bd01-6c04ebebd0be@ixit.cz>
References: <20260531-qcom-cphy-v5-0-6be0f62b4d65@ixit.cz> <20260531-qcom-cphy-v5-2-6be0f62b4d65@ixit.cz> <ah1HhruI1Qc2FfwG@kekkonen.localdomain> <c8cda422-1a02-4a2d-bd01-6c04ebebd0be@ixit.cz>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: 7ea8f7d8d887c7454941637bcb5b9b2cbe11003d
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 01/06/2026 13:48, David Heidelberg wrote:
> On 01/06/2026 10:49, Sakari Ailus wrote:
>> Hi David,
>>
>> Thanks for the patch.
>>
>> On Sun, May 31, 2026 at 03:08:10PM +0200, David Heidelberg via B4 Relay =
wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> So far, only D-PHY mode was supported, which uses even bits when enabli=
ng
>>> or masking lanes. For C-PHY configuration, the hardware instead require=
s
>>> using the odd bits.
>>>
>>> Since there can be unrecognized configuration allow returning failure.
>>>
>>> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> Acked-by: Cory Keitz <ckeitz@amazon.com>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>    .../platform/qcom/camss/camss-csiphy-2ph-1-0.c     |  8 ++--
>>>    .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 49 ++++++++++++=
+++++-----
>>>    drivers/media/platform/qcom/camss/camss-csiphy.c   |  5 +--
>>>    drivers/media/platform/qcom/camss/camss-csiphy.h   |  6 +--
>>>    4 files changed, 48 insertions(+), 20 deletions(-)
>>>
>=20
> [...]
>=20
>>> -static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> -=09=09=09=09struct csiphy_config *cfg,
>>> -=09=09=09=09s64 link_freq, u8 lane_mask)
>>> +static int csiphy_lanes_enable(struct csiphy_device *csiphy,
>>> +=09=09=09       struct csiphy_config *cfg,
>>> +=09=09=09       s64 link_freq, u8 lane_mask)
>>>    {
>>> +=09struct device *dev =3D csiphy->camss->dev;
>>>    =09struct csiphy_lanes_cfg *c =3D &cfg->csi2->lane_cfg;
>>>    =09struct csiphy_device_regs *regs =3D csiphy->regs;
>>>    =09u8 settle_cnt;
>>>    =09u8 val;
>>>    =09int i;
>>>
>>>    =09settle_cnt =3D csiphy_settle_cnt_calc(link_freq, csiphy->timer_cl=
k_rate);
>>>
>>> -=09val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>> -=09for (i =3D 0; i < c->num_data; i++)
>>> -=09=09val |=3D BIT(c->data[i].pos * 2);
>>> +=09val =3D 0;
>>> +
>>> +=09switch (c->phy_cfg) {
>>> +=09case V4L2_MBUS_CSI2_CPHY:
>>> +=09=09for (i =3D 0; i < c->num_data; i++)
>>> +=09=09=09val |=3D BIT((c->data[i].pos * 2) + 1);
>>> +=09=09break;
>>> +=09case V4L2_MBUS_CSI2_DPHY:
>>> +=09=09val =3D CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>>> +
>>> +=09=09for (i =3D 0; i < c->num_data; i++)
>>> +=09=09=09val |=3D BIT(c->data[i].pos * 2);
>>> +=09=09break;
>>> +=09default:
>>> +=09=09dev_err(dev, "Unsupported bus type %d\n", c->phy_cfg);
>>> +=09=09return -EINVAL;
>>
>> If this is the only reason why you're changing the return type to int, I=
'd
>> suggest using WARN_ON() in this case. I presume it'd take a driver bug f=
or
>> this to trigger?
>=20
> Thank you for the review.
>=20
> If others agree, I would also prefer WARN_ON instead of changing return v=
alues.
>=20
> David
>=20
> [...]
>=20

In the standalone PHY we validate the PHY type in probe :)

WARN_ON() seems fine to me though.


Reviewed-by: Bryan O'Donoghue <bod@kernel.org>

---
bod

