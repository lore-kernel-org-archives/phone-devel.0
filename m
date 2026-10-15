Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D858486420
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062524; cv=none; b=koiaHRUafgpXInP/FajNZ5eEf1/sZsc29vHI9M6gJyWPp+W87ELbfqMqb82Z8mwaDCb7B5FVA5Q5YlLtwk8+T5O0O2BViKzK2h3oipjo6baQGS9Ij6t0y1Z2ehCKo1V4uzmBcg4gdMjyeW5R2z3Y4HQV4cx8Ae4MzIDvVJbCgjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062524; c=relaxed/simple;
	bh=f2ckxXyZQKuh9nsM9vxf6wcauADxi7RuciAXr8hyfjo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBA5duZBijv6R6eT/WsrgfBvWYN6qCcahHbFQgEdGJUfqplhbQW1VUI2u+wilKJpuXwrNVhTDvEPTXm+i2yyzdDZP6ok7wD0E2fcoPXfHZrvbLIGVgxy7AD1Q1lz1GI/eNOkVmFpfnxDTLBD0PU160QQjznj0LT3GJ4G4PPA8fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Spy10IAY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqauuPq2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Spy10IAY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqauuPq2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jYhP2966401
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=; b=Spy10IAYbSeks5Us
	4lnnfmwbiPTw91h/+TO/EPi+I/PJCJAe5BG1dWIM6cnA/hyu8smJ+NN0zg96kj5o
	nbzb5n38ExrM4lkZ6660jMFaZpJKpekrtOD0BWCXiI3wRDLFslXwRppTdMG0MLK9
	u0p4KuKC+5cuVigijTsXVITYrvPXPr8YHWeSmdU98AZXorsjFGR0VaioSfVjl/jf
	UNX3FNNlp1IaQ4ZchQDV64a0VbPqA+MFuVzQ6+ZnSdtSXxyTRQh1sn2aTiKckAhY
	aPsdILygwprRMkeN6yXUvm0jIlUWsTpX8V7odNv1A5f8/RroIxYfCjgrRKB2z/sg
	l8HXzg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuqtg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 11:08:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90520763ceaso19621266d6.2
        for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062522; x=1792667322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=jqauuPq2jvbRTxYhRYiiM+P0ygq62mnc3KwOdk9wK7/j5+2mIfUmybr495fbtZO8eg
         nagCfBQ5CHWsp5pTbBOus4Pgj1Oze1SvQBpUWtwcqI794x7zT8ByVGPbP8XF2stVvlEO
         d+eA7rRAhbse+dj51VQ7agvzS8EQu26HQhiVcAHnS2yU7BbvF65RFAg1Pq03rzKOqw3A
         RtpS2Y+UFSLu+OqcYPkGxBbrzKltmIkUXcvYcBdhuwWZtCFPuv9+3xygxRVJCWZLYbGq
         mPMOdQAzk7+NZgeF1BNofybmUZMc65hfaBGAlWhrcJtmakdu2d/GQai2eCfnwKhQg3Gc
         LKhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062522; x=1792667322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbgCTSTRt/wLTSirkAGLIvHi0DrCG2dHr20NOaz/VH4=;
        b=iOhiia+BdEZLm+7FiVaEE170hVeLnSoTZ4F+jJyX4QNibD2jEW54cS29LYq+KA11/I
         03goziRwmG1VykjBev3aTqXSoNkWGk5Yv/xFmAP/ypBDGXXvGrKHvkKU/vYGFBmgkmKz
         pIw+gTud6jyj/RhNKd2gvnhXOgNWiVph8t5L6B7ciufNRL/Q9OqwndQQFLlO7HFyXsGY
         6Kh2a+2Q7sYdaOfNmeW8oVIxhSqSa6CSdD21EOa9y0lg0Opfa10hK6mU81yRcfWZELBe
         zhuKm7C+buUe+Hjd5kuJIvgMqbzyMO4fJ/sClz5L2tULPOvG15CKE15cDRzZmyfRgbko
         6+AA==
X-Forwarded-Encrypted: i=1; AKwUvBzg4jrBmIiZJyzge5t0KJ4BuSoO8TtzKFJGUvtGF0XhRNNmY6VghXj23gry0FYE3Aq88Hs22k2eUCuT5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKAEwBewUX0QqyJWEqk5r1gkHfRUehhKYQYtycu09cmf00JQqav
	6oSlYKj2fwAlVEQNRtb4jH5I7J0lclVc5OX0MQcieSJDuWu0IogKAlq5HZkbKwvNgUbjjhi/t6c
	2NEMMf38YT4AtImieLcYfQQT7LbN3HtiXHDtZ82jr2UEi9yflNRbVhxY6muvLwH5ZBw==
X-Gm-Gg: AYBFou3tLI5V6aOKwaNU9N1GEqA29PYti/bFECx8PW9VcUk5ceixgcS9QtIlflCtr1o
	TtO4BxKvES6rUxEYW/16XZ/SJgbHbSXu+czAQoFnvD71A6rkVtRoe9hZK0he1pFG0fz2EMnKgo2
	IpLGTjK9pRNQkMX9KUxbojAZ7UtO5tp4eYo5RxuwugSFIeAmokqoKVSfUsTnLo2OhG9dIFZNvgm
	WuxWNrKs/IkZpXE20j3zAQ2W4I9/Gawy1ZuHCYS/WXe5dwyD/9p341kvnmTx2ghQWt9dNe663+p
	8hZts+h5yHyifx1kk4Q+CEXtaLxGXeVKyUCSTf2dgPV0bDEkfQEWncl9CBKBfOsTkNQBKwLad8b
	+36+3+vAIZU9w0Nl7goDCOw==
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254358185a.2.1792062521391;
        Thu, 15 Oct 2026 04:08:41 -0700 (PDT)
X-Received: by 2002:a05:620a:6498:b0:93e:e111:2771 with SMTP id af79cd13be357-93ee1112d0cmr2254351785a.2.1792062520818;
        Thu, 15 Oct 2026 04:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b20388545csm2280628a12.22.2026.10.15.04.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:08:39 -0700 (PDT)
Message-ID: <b1570552-958b-4cce-977d-f04e03fdb4bd@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:08:36 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] arm64: dts: qcom: sdm845-google: Add WCD9340 codec
 and microphone capture
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260925-pixel3-audio-v5-0-7ffb32c980bf@ixit.cz>
 <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925-pixel3-audio-v5-7-7ffb32c980bf@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfX54mcacvCTyk4
 vdoHu9yK8dUJTF4RMIcNW1sNYLkawkEMv7X+NaB8sEfETCuXVfmthugITcHnWQHsdxJzcR86j1e
 IhbL94xNla67LB+l69j1FHrAlEJHLIM=
X-Proofpoint-ORIG-GUID: O9K5yhnLzoqavxsPhzqk887j4RxF6sJS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0NCBTYWx0ZWRfXycupUttkgNPE
 KwJu7g2MhFb1M7gOJ5Ai2wmPthkb0Yg3N1AwyeDc2+UFTz8pphQnma4hiSVZ4oBv7kw2E6qj85/
 3d7npXW3ExeikZTYEYDEZWvIQA8TZrnvUs0W7K3TB9ArO7D0Xgt2PbKSnIlUzlRPgDbi50p4m/a
 TRKF1mX7JIsy6dww2qPqyPibAqTLd+Rfv8v4YsBQUMUVhrBiEFZ4TyiQZV1aHIgfeR7wO4eb6Ky
 0RkNzzRskTnVQSXNxiNF/O+xT+r/vBchYExx7XDdgXAHtHts6BrIJHLCfCtahJK/FTYEDlrIgMt
 LPg4tptcgfM8a9yhh6yPK4EFa9xp9X0qRAICrNjQ8dg3lWUypvfQvjdsR8tRoefqBQwKN/RW274
 j90VyVuFzG+4J8QCIX3nv3kkakrgV5oMUrndy/P8+GXFVgqDWI7pIhEvYzSpUKzkx+iyaGu2n2M
 H8x3WIufPUCesWPiXfQ==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0b43a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=hkRLp1vvXMYqBSLCnVoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: O9K5yhnLzoqavxsPhzqk887j4RxF6sJS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150044

On 9/25/26 5:28 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 sound card so far only drove the two CS35L36 speaker
> amplifiers. Wire in the WCD9340 codec , add a SLIMbus capture link
> for it and route the three digital microphones

[...]

> +&swm {
> +	/*
> +	 * Nothing hangs off the codec's SoundWire bus on this board: the
> +	 * speakers are CS35L36 amplifiers on QUAT_TDM. With an empty bus the
> +	 * controller reports port mismatches and frame-generator timeouts on
> +	 * every boot.
> +	 */
> +	status = "disabled";
>  };

Does our driver need fixes?

Konrad
