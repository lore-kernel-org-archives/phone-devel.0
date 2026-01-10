Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640823817E;
	Sat, 10 Jan 2026 05:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768022886; cv=none; b=DpCCdnKefbOFtcK+rcNd1pH45YlIgQueaC8CA2f4fW+X/DXnBlgttfIJ2Ql+57tfBRQkbEm3o07OP67U3fgnAUXKjy9AaUF5BPvaak4Y6qIzkmslXmdJiquHbSJfmfSbLpr9ppWBFrlgpx2EBncBStgTpa2SzUPUCfe9UgcWKD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768022886; c=relaxed/simple;
	bh=6pDUPiuFiPqNLLaA02BruImiD4RCNyvRpgK6pYgKfT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NlTRkilRc1MMjxP0DEfP2lcGqOcKSJvOylgkxXmQ/QV1NdDIWftakaWeccU/rsvYq01Fv5ouhX2R+wAHu/QVoa6SCZ3KpCPqfhlln0wWquv9WRP7wnal7EyVlWl6Zq/1EohI29uIot16lphctSfImV8M9uCV6zRCdIrnzIi4Qmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in; spf=pass smtp.mailfrom=machinesoul.in; dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b=ROIyPfgm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=PKqPpEvY; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=machinesoul.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=machinesoul.in header.i=@machinesoul.in header.b="ROIyPfgm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="PKqPpEvY"
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 9941BEC010D;
	Sat, 10 Jan 2026 00:28:03 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Sat, 10 Jan 2026 00:28:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=machinesoul.in;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1768022883; x=1768109283; bh=Vlu0eptfBDk2LzNmZS/x/2Ae8ytOqM3P
	3I6cBadH/AA=; b=ROIyPfgmDF8UxP3PQxd1P2l8mq+2mSJpSFVzrvk5ER4gQdHQ
	2AcMxWx89hE8mHfOQXmv/u7Y96oLrzLzSV3KbmYFoJZciRZQBxPvBf1L0qDyf7ua
	EZAfpZEKO/EUYCUQqnk4T/FQXRWMkFl9eYsP6kAejG4WkQNNWtEUdG2TCJTNefaj
	5a+pTX0Wx5SwP17cxIPFPoC1XLgSdldao5RnfS70uTbJ04441oozVLjvw4muDvuw
	/RzXQXfaLfs0bRF3shz4aGIdevmuztyQ2rNyKgbwp0pmhHRAZ9/UqZPWegq6BF7h
	IAwi0ks2mbRzZ14UrBA55ARxAVBurxRwCi+cXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1768022883; x=
	1768109283; bh=Vlu0eptfBDk2LzNmZS/x/2Ae8ytOqM3P3I6cBadH/AA=; b=P
	KqPpEvYlrHcEPVKAN7wTN5Fs3PbNr6CmMwU7LduoZER51j81Vb5A9JNYKEr3MU2f
	NehYhWUC4iAXacURzTCfkWL0B5dD2Sb/nrOYk4HhnemytdWCxKdMqFmnK2K7MdT2
	Ek6HV9ZsEQF8Vda6qlJcCzQKgK6SxeE2+uDJ2S5Rd08xBERxuzMxF1mCea76qAdc
	vT3paE1YzytyDFBExd8wLVLA/0Wd2R6Z3f4aJjT3xj8hW3mZHEHsXdbnaPNzvzvN
	VOyrHRkTErTUdGlYvwxNAj6dNIumqxtuMoAWtaj4l/YiuuNeCN12JnSKH25l4Op/
	EDuVDKRnTpwCzlWv4N0lw==
X-ME-Sender: <xms:YuNhafTg-13QpBfZirbMwSEJ_b22m0in2lIXbYBVUnMDFN9_qu0Beg>
    <xme:YuNhaXJ-tJuoQHQtYWOPcoAHinK-7hlCxkrEhO-vQOqOpUJMCeudSkhcn6kbDerZb
    gwCfwzVnXXceoS3AotD0MgT763wBPo8Lhk7hfbv0uPlkLo512I3Ac0>
X-ME-Received: <xmr:YuNhaRFkfF9xJxRjConZZt51NXYD-QpUXeZfx_k417A77n2aHUnY_EDiXf-zQM3VV8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduuddtkeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkjghfggfgtgesthfuredttddtjeenucfhrhhomhepuehhuhhshhgr
    nhcuufhhrghhuceosghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinh
    eqnecuggftrfgrthhtvghrnhepgeeftdeuheetjeevveehkeegledttdeikeejledvgfdu
    tddvteevkeehudduledvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepsghhuhhshhgrnhdrshhhrghhsehmrggthhhinhgvshhouhhlrdhinhdp
    nhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlgh
    hirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepphgvrhgvgiesphgvrhgvgidrtgiipdhrtghpth
    htohepthhifigrihesshhushgvrdgtohhmpdhrtghpthhtohepsghhrghrrggufigrjhdr
    rhgrjhhusehmrggthhhinhgvshhouhhlrdhinhdprhgtphhtthhopegrlhgvgigrnhgurh
    gvrdhfvghrrhhivghugiesohhrrghnghgvrdgtohhmpdhrtghpthhtoheplhhutggrrdif
    vghishhssehfrghirhhphhhonhgvrdgtohhmpdhrtghpthhtohepmihpohhsthhmrghrkh
    gvthhoshdsuhhpshhtrhgvrghmihhngheslhhishhtshdrshhrrdhhthdprhgtphhtthho
    pehphhhonhgvqdguvghvvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:YuNhac2A98zoAmpDORfia2tm6xDl1q7j-DAGtMwm2r8mf63kbzYhZQ>
    <xmx:YuNhaRIQAL-FkQvFePr1yoMJJSrIsoOaKEhCiTiYCROSht2Ro9E5Og>
    <xmx:YuNhaZ1PudttDFYQALzp9Zufys84sGs6gXG_2-2mr1Uc8JbvTtR-pg>
    <xmx:YuNhadnWFxAzQdY4hMBNX0S_Ms1C-8L303MegkxtWoUN1QcqT0tqPw>
    <xmx:Y-Nhab4QJOZNRdPT8VoRPWk_irsq4elu--7DQKGWpkjtD0n_VGr34m6Y>
Feedback-ID: i6b0e4831:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Jan 2026 00:27:58 -0500 (EST)
From: Bhushan Shah <bhushan.shah@machinesoul.in>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Luca Weiss <luca.weiss@fairphone.com>
Subject: Re: [PATCH 2/2] ASoC: codecs: aw88261: Add devicetree support
Date: Sat, 10 Jan 2026 10:57:45 +0530
Message-ID: <5862699.31r3eYUQgx@antlia>
In-Reply-To: <20260109-aw88261-dt-v1-2-45840c7632a3@fairphone.com>
References:
 <20260109-aw88261-dt-v1-0-45840c7632a3@fairphone.com>
 <20260109-aw88261-dt-v1-2-45840c7632a3@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 9 January 2026 20:32:06 IST Luca Weiss wrote:
> Add the compatible "awinic,aw88261" so that module autoloading will work
> based on the compatible from devicetree.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Tested-by: Bhushan Shah <bhushan.shah@machinesoul.in>

> ---
>  sound/soc/codecs/aw88261.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
> index ceea0c8c60b1..810c90f5e783 100644
> --- a/sound/soc/codecs/aw88261.c
> +++ b/sound/soc/codecs/aw88261.c
> @@ -1269,9 +1269,16 @@ static const struct i2c_device_id aw88261_i2c_id[] =
> { };
>  MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
> 
> +static const struct of_device_id aw88261_of_table[] = {
> +	{ .compatible = "awinic,aw88261" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, aw88261_of_table);
> +
>  static struct i2c_driver aw88261_i2c_driver = {
>  	.driver = {
>  		.name = "aw88261",
> +		.of_match_table = aw88261_of_table,
>  	},
>  	.probe = aw88261_i2c_probe,
>  	.id_table = aw88261_i2c_id,




