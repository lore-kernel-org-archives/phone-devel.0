Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CC93033CE
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770824898; cv=none; b=HBSYcp8bP+J58KT5xW83Ef58nZS9ZiqpHy1cAeXjsYWpuWgpgi0gVU6km3onm2BU98PeN3s3vgP0jyfI246mp5uGzgJXg65h7DiM0ucATcShCsY0LMCE8Z/QCH5Ewzucm825zf8rOWJzn/M1S9re6vU5qES23K0a/rrEvGy8Tak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770824898; c=relaxed/simple;
	bh=VBRIyNi8N+iHonVf3Yf37cRzgOZh5aKiZE9pdBVeAqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuHOCH6LtyzjKzyzugxfIaGumpNItOqJgmRVKi4rKDD2FRs6xVwR4V4t4MKodRgat5Nb/y8B1nKzGIRcBsSETTO29sHGZ+eUWKr6SAwC51IyczTJaWLbUA0gQfjB6AbaXGJ74yYbwnLMXdIDYlyAlRL8pEpAWmLMQdXKU9nPRL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=czgM1u8Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WURM3hJs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="czgM1u8Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WURM3hJs"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BCVPpk519199
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3h+65nGr1zrxcuS9iSxavdhI
	M1kGZX11XmzGiEmECxw=; b=czgM1u8YsaaAv78xDzDhIMExxRKK2rReLpmCnnsW
	0IZ88tzqPfYeIFIUwqYg014cS8ov7I0FBT3qYbl4QeMLVcLyidkY8Qyb82X4ZjeX
	PJUGUJle0k/TmfJWq9vkv2oWGQm668EzWuz4CTM7K8gsRUJbpNTXLUItLSqQE+u1
	YzPkcCEk8c1Tn8QgUyIQH6ZkOPMU0DkcQ5IP9soWTqilCDBOf66iUs0C39EkvY8I
	YGCUZOZc9UZ+VqkufszRLXEvqMc5z7ZuO/lDfWoTQ5op9NlrGBOdzv3wZ8k8U18x
	uCtsrjFlWb5jZDlOLGvWDTgI/2ajfbEN8C0tb96ai0/dhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8sup8nfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 15:48:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5296c7e57so2148859785a.1
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 07:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770824896; x=1771429696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=WURM3hJsv2tt79miaOgjWS5DxyAy+HTzJIURzRN9B/NAeUd6CiqSR7epx2iRsq8+64
         W7E21KSBq60YDeJQMU1PRyRIOYLOGrdkSTca41qZT9369eVJJ8v5B0oZK4VO9Sz2xT3e
         yG6hFUng17ehVHZg7+Jj8vdCJPUEoPZ11u4dv/FNyD6gbgAgThOLXMVzRnb+jyA+R3/x
         +z9EJR7opy19ZLTJLPdyVhw9zmkHWxMdvZjQTWDgfVfHbHEPQKWWFUgOgjCBQQ4bqAJR
         5JVIo8ev71Q4C++j0vy7emiQMbMEG6Od0b6K8G1xzO0tqC6Csub4SU1JAnc2AHd88AhS
         2ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770824896; x=1771429696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3h+65nGr1zrxcuS9iSxavdhIM1kGZX11XmzGiEmECxw=;
        b=Rn1ixKcOStJsPlNVfmdqe6G5rsBaBI0D7/tHZkweXjMU6QtC9DiF1F/hTqyGBedAZs
         +PF8RaDeKdhlEUAtLUJ6l9EA5PxW5y7E5+h7p2kXV9OPYWIH2l9/oJu9xc6yGVD743HA
         h0/myXOAaRUSTAYt15CIBrcHguRLXOO5f4OL9+eWy4h1FOGAHuBPWOfoODRi0pPhR6je
         sGqMYtZrbcHp3/Dq+UnTxf/4XhYfyC+J+4qvbiO8jV0I3Uys5An4yCB7f9wzHqA0uysU
         MbBIlbybom6cj9Xkw7vzuWxbRPxdAqKJEUxDmBztY6WUsd3tKr18j0w7sBeH09yohn8B
         ppjw==
X-Forwarded-Encrypted: i=1; AJvYcCXcpgM7wfTyk1q2UUB6oKdkAUl3iAK7RnJKgqQJl23AOw3RS7fWLpuYMsgdvDGyUSUw/TYw5481EWBt2A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jAVLOW0sVXiYkxdMwi/Yb8p+OdaDpoAI66MDtm3y8wS5RRay
	ZdmKp3Imr/lmP/G7a6OaTaagMqsaxADzkSnNgWHPqgRFe9sCsN+be2P9lP/ACZn3umCDD2fspyj
	fRgDFqyhEWbGn9dGga8v3HU2VnqS3MCK5O6gsJ89j39O4px6BayiWMmSyMaWmIL74Qw==
X-Gm-Gg: AZuq6aKCZtH+uMdPpelRqp37SIlsrUZ70Pornc4fRcmB8cAP8e51RTV+37ujYMDEEUM
	aQlcvJD3/eTU52fHmX7jflLysjNd5I94SxrjuXtSVAjw5htkYWb0pkG8gVQNPyi545DSCXkzzWX
	b1bvRnhoqfFg+Wr4OBy4JfOTWOLwq8AWW0w5RRLIwbWub3CRkJk+jxZR+EKJmiuAwUwO8Lm4foT
	bS5qNqvjbVsusAW9yH6B0BxrskgzVb5+AaKj4DPlo2tstwGqt79XbK/ohl78Asb4vCvnRQNStMM
	Vve7ZKIIvL1HvlyJ+7+lbpx+UtrFuwDXkV771bjZj/3aqAyGWyaJiVabkrdJic7MvtpZOVRymN/
	7UyMPSBEGEmBCHtVM11GQElbSqDlnEgPQNoxl5/2+VXguxK2JkWRTxWT1iKcYy2pppx6+RE3dP+
	kFoCKDPXVH4E+t+AGiRA3ZOAXvniCgUTeGKEw=
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389200185a.30.1770824895799;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
X-Received: by 2002:a05:620a:7014:b0:8bb:26db:e22f with SMTP id af79cd13be357-8cb27fb7c79mr389195685a.30.1770824895266;
        Wed, 11 Feb 2026 07:48:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f51edcdsm405137e87.0.2026.02.11.07.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:48:14 -0800 (PST)
Date: Wed, 11 Feb 2026 17:48:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bhushan Shah <bhushan.shah@machinesoul.in>,
        Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: sm8250: Add quinary MI2S support
Message-ID: <aqjyq5rjovomjod3gmlwh7s3wmlmezom2ucg7j3dlvji35ern4@i55nyr2dxcd7>
References: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211-snd-sm8250-quinary-mi2s-v1-1-f62e49d85af8@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEyMiBTYWx0ZWRfXy6y/9fOVU0M+
 9B66FT0lOxqMF9+0IfOPFgHGXhaA+e4X4kG3TdxYV33JmGUyIk3oXluTY5SwK1dXtXPLQFVXqk1
 JOHqZDOoxX5VPedrqiOhybacuunZZF4NmZb8FFLeREbE1cE70KjThA0KFczDHvPiP/y9lot/NEq
 tdy7QRjpZ3OR2k1D/nj+/FSZJ/armRFNIRcvMEx5H0HfnhcM/QTT7BG88ZUTt2gwaXF1XLmGc8T
 VbiFDri5r49TjvRdgyepyfG4dPbHxC7J6+7gz/Y9LmZ/0viPTHZgcnV92jLsMa0dqzWSXTmOa3i
 4a7c1ISJxaHT8BMWz6alYAkxLO320n51oiN3se1fEX7hqZ3fdjkiaMeltHuGa7yvoTnOr+rwUaQ
 4Z4sN14Jq2ei+2YgriwkQzeiNciuupjIwxMPFL864IXuq7UrJijn2VU6K0ooixVrG6TjUkO8tcA
 qYpPo5+subH+0UtpQoA==
X-Proofpoint-GUID: WNlGKW2ENaPdEd6C_VF4874OaClqk4-e
X-Authority-Analysis: v=2.4 cv=Uslu9uwB c=1 sm=1 tr=0 ts=698ca4c0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=a9vZSWQi3jmT61OOzWYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: WNlGKW2ENaPdEd6C_VF4874OaClqk4-e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110122

On Wed, Feb 11, 2026 at 12:30:10PM +0100, Luca Weiss wrote:
> Add support for the QUINARY_MI2S_RX which is used on some devices to
> send audio data to speaker amplifiers.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  sound/soc/qcom/sm8250.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
