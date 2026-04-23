Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7546738D017
	for <phone-devel@vger.kernel.org>; Thu, 23 Apr 2026 06:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776924670; cv=none; b=qZbty6icZijABXIkNIeyp391G9DNgc1Os92bXnWZM4pSCoG1IhLSj6udUnYI9vFwSK7I3/GMq6TEVjOATALlKx7Jv1b4SAyx4P/+CBPqlLa+D08zv51W5QIyB9/u0XxfCoFE60LCOG/xSa1YWMlcvhMDGNhJqcjeUUj8SClZurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776924670; c=relaxed/simple;
	bh=WOrKOJR71lSSEbrOQxKdvEYkwv/rR/+jiveljJNwSCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=CioyxIAgJ/V/q9S6IlwMkWLDTpG2kGHGJxQ9I2PLUhKhgPS2IUZEdb41Zo9rBHyLLRBZYCxD5szbiNFHF5h8fWkdQBLrhUy9HzJNCzC4JALmtESR3p5T3EWn9V4uXX84OvDAeFrvlU4i9NKbgFqrd8nlPLUu3cDK53Dh/Zb2wwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IEQSkHuI; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IEQSkHuI"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ba92146cc86so499665166b.1
        for <phone-devel@vger.kernel.org>; Wed, 22 Apr 2026 23:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1776924667; x=1777529467; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ct5MwsIQzYx6IC/ibX2+EvebgSz1yi1aAGAGW2PAu4=;
        b=IEQSkHuIWGs13fzw0Ru5KIF2amckmxeD8Vt76UO864YvMCdlFrlhuEkJIfik253z1i
         BZje0fPweElYy/q4UnpnLBBXr3i9joiu0hhy/2/aPlFnsddYQpm2e8RIcjXMEhPhAekU
         8qBIrrQmQamrBEkESCaleM/+yZIm6Ot8T7B78/KnEShj3SGUtmKCY0cwEQY0Mjn1Ej8j
         lbt9TBWdEAjgE51l5EMDVeMiVYV0s8y9lOoi9w1a4JypOUW5Gu5E+4bkJVNNVYJ4/iFQ
         kieX9aVw1gwcYyf1LBnu0LQAlScBu3/6LPgxh426ULmaMrGVfqNhe2SZRMlUT9FL5dWk
         4nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776924667; x=1777529467;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4Ct5MwsIQzYx6IC/ibX2+EvebgSz1yi1aAGAGW2PAu4=;
        b=gLOnH5E/xqW57ZPy4Hnxc546XbJ/4WoFICey3mhxqUFDlp5oO7LM5Nt/RlBHXM8WgB
         z6/wn+z28x9glv26AgdTvNfqs21jaWsqNkU1QaO1Cl0OZ+EPfgzoS2IcHODlMvbcsPwW
         pCVnD+ZxdpKCPZhLdXhm0CyKOwGCNmq8qfMQaEtfOP4RSYslQ+TMwmPWPLM/DmgQSiX5
         P6CkLnLhDeztqeQ76DB4YftBGjPn1zmzZqrIfTJBVL/wZ+6FCNRZlehOjohj/f15cz00
         LmToCBILmAH5jB5yxF0o0HZt1KF8xdp6GIUZ4cTEF2tuJ25zkCvz/YUXOQmomhxA/Xdv
         GlRg==
X-Forwarded-Encrypted: i=1; AFNElJ8Od8k8dnMTtBOS+JTFCvxq/CX59gt+lyHhm6G0d4RfLm2XkH6HJesF0Px+ifgMNPaJVwyPF3RyftmMqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhgTuOMhAB9IZUzNLYTJsTLLqtfji9dcHWgM56WGZcHuzD2Wm
	LjH/UdickEEjWYKn7ITAxKn4oitVJwcWLOGhzNYfvTC+gq1sKfJHy1U5XDXA4z4E1uo=
X-Gm-Gg: AeBDieubzLPJ3d4TeOx5YM+SdF7oICBTp7A31mpJ2M4x1Fl+wyUpjNLLbLQwcLSvZOK
	1fwoBWoWbVD81Nzyx4cSz5rFzUIGwxnNmUANJRx94PtNoCYgYcIAw9Iu8XGOq/5ovNvVXcNVhZ0
	zdI4CWsS+GAEPo/QyblkX6CvjC6+msFidRcdgvunnqztzvGha4ELnCaCFS/dAa5v7pJeTPY7auS
	LkzG2mVYyvMygRXiGqUqhWnPDsE/S1O0ktxJtsEbhOJBUn6153iaZ9UZOECs960ufthBGJZL34n
	dbW1Km9ZbwDvtpKEh+cFSSLfNN0aGIwlfrLrZYYdfRx8Tq9bmYw+JMnjXbJAH3TcbB8HF/G5Riu
	pwbNGJ7F2tTkZH6zcCP8nyzjTifdsGA0V/p4t8TJK/ZxSAkalPCYqQjSfrUzCoClNN/jj7tWF6W
	t9QT4OvRQFb4e73I2rqRWd6GmfPo1CrBOqbVNJb6u6l7lS9cB9FHCSRLaKxIC0DAlBAVnhqjr/k
	x4rO4ImbQtg6aKxJpoRTNHbvwlOVdqFXhzlvxiuKNmb6cI=
X-Received: by 2002:a17:907:60d5:b0:bab:e307:7bdf with SMTP id a640c23a62f3a-babe3077ce3mr162415866b.19.1776924666676;
        Wed, 22 Apr 2026 23:11:06 -0700 (PDT)
Received: from localhost (2001-1c04-0504-7401-4b2e-1820-6d24-b264.cable.dynamic.v6.ziggo.nl. [2001:1c04:504:7401:4b2e:1820:6d24:b264])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1b908sm627916666b.34.2026.04.22.23.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 23:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Apr 2026 08:11:05 +0200
Message-Id: <DI0B81W07N33.3HZQ4R8DEJ9EJ@fairphone.com>
Cc: "Bhushan Shah" <bhushan.shah@machinesoul.in>, "Luca Weiss"
 <luca.weiss@fairphone.com>, "Antoine Bernard" <zalnir@proton.me>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response
 type mismatch
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Val Packett" <val@packett.cool>, "Srinivas Kandagatla"
 <srini@kernel.org>, "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown"
 <broonie@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai"
 <tiwai@suse.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260423050801.210840-2-val@packett.cool>
 <20260423050801.210840-3-val@packett.cool>
In-Reply-To: <20260423050801.210840-3-val@packett.cool>

Hi Val,

On Thu Apr 23, 2026 at 6:41 AM CEST, Val Packett wrote:
> The response sent by the firmware when requesting a clock vote (opcode
> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
> returns one single u32 which is the client_handle that must be used in
> future unvote requests for the same clock.
>
> As a result of this type confusion, the status returned by the callback
> to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
> only interpreted as success (0) most of the time due to luck, but there
> are reports of random ("more likely on cold boot", "depending on hacks
> made in other drivers") errors such as:
>
> [   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> [   20.961131] Failed to prepare clk 'core': -110
>
> Fix by correctly interpreting the response as a single u32, and actually
> store it as the client_handle to ensure unvote would work correctly.
>
> Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>
> Found by reading and comparing with downstream:
> https://github.com/YumeMichi/kernel_xiaomi_pipa/blob/27190355fb31284988dd=
f505cb7cfba5128104cf/techpack/audio/dsp/q6afe.c#L1261-L1263
>
> What's really bizzare though is that some of the logs go:
>
> [ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd =3D 0x100f4 returned erro=
r=20
> =3D 0x16
> [ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
> [ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
>
> ..where the "returned error =3D" message is something that can only be
> printed by the callback if it goes into the **other** switch() branch,
> i.e. when hdr->opcode =3D=3D APR_BASIC_RSP_RESULT. How reading out-of-bou=
nds
> only in the AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST branch would
> cause that to happen (even on a subsequent vote after the first one to
> perform the read) is beyond me.
>
> Still, the person that reported this heisenbug told me that this has
> actually completely fixed it.

This seems conceptually similar to what I needed to do for SM6350/SM7225
microphone (wip) - it's not necessary for just speaker btw:
https://github.com/z3ntu/linux/commit/107bf0c39e40a207036e963f878f39467f978=
393

There I'm storing this handle per 'block' and not just one "vote_res",
essentially copying how downstream Linux does it. Your solution
definitely has less lines of diff, but I can't judge whether it's enough
to store it like that :)

Thanks for looking into this though!

>
> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 40237267fda0..28b5b6b91897 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -379,6 +379,7 @@ struct q6afe {
>  	struct q6core_svc_api_info ainfo;
>  	struct mutex lock;
>  	struct aprv2_ibasic_rsp_result_t result;
> +	uint32_t vote_result;
>  	wait_queue_head_t wait;
>  	struct list_head port_list;
>  	spinlock_t port_list_lock;
> @@ -968,13 +969,14 @@ static int q6afe_callback(struct apr_device *adev, =
const struct apr_resp_pkt *da
>  	const struct aprv2_ibasic_rsp_result_t *res;
>  	const struct apr_hdr *hdr =3D &data->hdr;
>  	struct q6afe_port *port;
> +	uint32_t *vote_res;
> =20
>  	if (!data->payload_size)
>  		return 0;
> =20
> -	res =3D data->payload;
>  	switch (hdr->opcode) {
>  	case APR_BASIC_RSP_RESULT: {
> +		res =3D data->payload;
>  		if (res->status) {
>  			dev_err(afe->dev, "cmd =3D 0x%x returned error =3D 0x%x\n",
>  				res->opcode, res->status);
> @@ -1001,8 +1003,10 @@ static int q6afe_callback(struct apr_device *adev,=
 const struct apr_resp_pkt *da
>  	}
>  		break;
>  	case AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST:
> +		vote_res =3D data->payload;
>  		afe->result.opcode =3D hdr->opcode;
> -		afe->result.status =3D res->status;
> +		afe->result.status =3D 0;
> +		afe->vote_result =3D *vote_res;
>  		wake_up(&afe->wait);
>  		break;
>  	default:
> @@ -1899,6 +1903,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, ui=
nt32_t hw_block_id,
>  			       AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST);
>  	if (ret)
>  		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
> +	else
> +		*client_handle =3D afe->vote_result;
> =20
>  	return ret;
>  }

