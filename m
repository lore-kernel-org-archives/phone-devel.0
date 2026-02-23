Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EA32B99F
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771866564; cv=pass; b=Zi2xFBGgKmumWH1UM/cohG8iRZFAOhWKee3z4dON7NpuucYqePvrrtNl8hrULmC8A9W0QTyPCSd6olMxZqSD0l12DlVnsiCBtSVNXc3BlT7T1B/EKeJSZpiZxzckrjlvB71LvLK7X7WkImLsmPjylA+obtF33zuYlVRY3k0y82M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771866564; c=relaxed/simple;
	bh=bEIj0WNA1JPDgmSNrfUPFvoUTelCW2u1zpq9ZizVch8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ouzjQGUcwhbgOiRx4TzCoZVHNzCXJce1elGYy14Q6PFJsv+as/XJiBBAbjz35glaVuQhF+kr7L0IDxKRYdiMUb0e021RqTyxzR2uHU26LDB1UjUiwW337bq9tBNHmFtPr9kZBGxsNTkPUTG7P/9+2yVgnBrOvGqlwv5zOlaNDC8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bghbiY7u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gUsWemLz; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bghbiY7u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gUsWemLz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYRdk561785
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 17:09:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v4wJf3RfvYx/N6YOBwnzs0nO
	tYOlLmOqFKLIASO8YBs=; b=bghbiY7ue+A1njbaWrWACoe4QvDba1Ik19DEIiKM
	hnDcfP2Hvy1NzP0BgmD6Px+voM/fNRgWsGU9YDZG2S0LNO1An9ywI78EjFaW1Z/q
	pe6E0bCamsWXbzYOb4Yw8znPhMqHU37n1N4D1KJxS1zYa4Ymb1iPw0kRJ9xSl569
	xBmI0paS2tPNhGNiIRf+8D39CtkwDHiZQZwpj01qONyn9E8tNSXzEJnSe//vzonI
	5yixri3ie5gm8Ch+2bLYlZjl1O2ZkRav2Z6BK8CU+rdK2InhgwRhagiKBM/eX24j
	NskMfvMIFTiF6rUviwUmthtXvp8bLTjPlyjtpCfT+bQl3g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8r96fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 17:09:20 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so3319568a91.1
        for <phone-devel@vger.kernel.org>; Mon, 23 Feb 2026 09:09:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771866559; cv=none;
        d=google.com; s=arc-20240605;
        b=UsPLgkfhpgDPG4C6lmsfHVQ1y/ld6zDYIf8I3Gu7S6gww6Tt0CDEN65dJSMZN2+Ib6
         O4sx5TJzFXyIn55xdVZ7d+zejZ1l3C/DHdO16XveG7J/+DMjCBi0lOig+UU6x2FqI5Gw
         UP/sKCzuG8FdQNO+2sV5OrAW6C26HgBmxj1VhPrw7Ux7uFEzu5mCm7NYZrRVRYtylPTa
         dS4TQbiIyACRxTQcRlRb7dsI498BA/Lr6wVTYrf+Z727O+UjcDk/J39IWd4PRYYuB4T/
         V83IsmsqbV03sqHOJ1jblhx4H9OGMRGIdNkbmvxuGxGcODAKf5nqB5JJ7V0N7Ycu0Tj1
         B0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        fh=BmmI3jExCIVgxC7HwSKPHyIeZE9awDYFgN9escMDMCI=;
        b=cp3+lcA3fhF2OIP5EOCL7VkZqmGb00ytg4Q0C1hEL6sO3s1yREb4kOyNnoHc+h1FXD
         PRBMqz98flHVKl6mkw2dvhaMXnpl27VXHrW71fQFfLCIAxyb7MpzEIBTcLwQTTAsvnIV
         pWhOYeEuTzz61UXaSOIQcqdqUdEeOOX8zdMWl61b/xWEPHTtjwwGCSdLv4NG5H99WUcT
         KeXymjV4LlbNKa6OiMto5yfIAbm7sRlp4D0Y7WgVlbhf16p7nvk7bzWxo+UiZqGTCW5M
         ALkoKuBx6FIOX5V9y/OXvQtK/NQEEyPoY0Ob1OWDUTu/3jHkanNNiTsO/La7tGFeSfF9
         pqZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771866559; x=1772471359; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        b=gUsWemLzTXOo8/80UcT2OKzKK3T2i1gWhZd0a4+pH7utJVn3LFoaW0eCb/9gbxlKVB
         AcUVE0UFzf2wGStSqZ8U1SI8XahxHgf76QGVtqFBPI3iBNocOB90zRJl6Dn1ijiiBrm6
         ySZNKtbBTY/d8NRGjwvCRavCXeiv+fYJ9wE6VrPNi39UPTKhMUpmrWRjQgHZsbmuYMhP
         CtIt6gudfMwN121F4/Xzt/VKg1G4baI7vCIb+cFyd7dPBfcA9ocSpgajdkZLyOhuu6VW
         Xc9MdIVNmyoGOnh/axvLEtFcDcDArjR5UukSr4H5jtragPfAuKF8YlkbiJ2of/FmoYL4
         RunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866559; x=1772471359;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4wJf3RfvYx/N6YOBwnzs0nOtYOlLmOqFKLIASO8YBs=;
        b=nh9wdlZVZm6soi37cP92ZdBJd0KOWU/pgHr47wcoM1sQzRzhlmBCUXT51MbHt1GuTy
         EGOMcMYt88PsAbdG9l2S0nqtqYaBXsQBhqTeOBrIx9RTVbpzSdy1ZRe4tVA7sfF/+thO
         tPZXWiVquqVLoWr7hTPaquxEp2KxpwtaitjjRiQRSr3zkevFCxevowkT1oLOdQGB7gPJ
         zpCCy0qLURID4XfoSHPmTSEbmrNPceoi3p5ocGSv3o1BwodjPhaH8ZxX6iLinM/kHcqy
         YpNhX9GVDxeVpuJvL52mdqHyOdCDpbRPNi5Vrmn+us/r0WOxw2OWNzYo16+6eXBheqel
         cpVA==
X-Forwarded-Encrypted: i=1; AJvYcCXnH++MUgC1V9UzkxiWOExVFSuTK0+q2U2GtIHpd9Ka2CFKktQc72kP6Uixg1Cd/c7EZgX42+8furavkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwgKCw+Hp/3X2zVu1CAcRvScCtOgNgpfofCc2DARbSwZGVzMcb
	mRoRkStV1m1IJ/9+FMAu+4Uqh8xHm2f5VKpYpRjm0j9D1WPu6vjFq9nNQ4h24N5irf2XKwOxmeW
	2M8KqB20op7sIowgqvJ/ppTPME3lYK7BTTte3g94cUjIXRp5FNzmeaIuLfq88YyqgOFV7fo5a89
	QhsoaHlWb61Qm358I/yaJ0DqbL8oaBUYhvEafIi8pe
X-Gm-Gg: ATEYQzwamiPIAAe0QMaJzjMG5wbJf3L3JRorkz+uspk7HfQbiO/TGL0u/hvF1eEw2w6
	DNiqjuLMTfEnfo2bXypD910oiaGduof8yAuq2uSiAzUnKy9Hp3402Ao69e+OhiLhjCb+7UJT7rh
	ApJiQhhHFGHwBZvkIDo55SKqNfQWCVJ9JgwFgHhu5wRCHd+avO/OI0yfJunGPRM6AxBqHWGAHbu
	RVsj6U=
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id 98e67ed59e1d1-358ae8c2d4dmr8000820a91.23.1771866559295;
        Mon, 23 Feb 2026 09:09:19 -0800 (PST)
X-Received: by 2002:a17:90b:4d90:b0:340:bde5:c9e3 with SMTP id
 98e67ed59e1d1-358ae8c2d4dmr8000792a91.23.1771866558625; Mon, 23 Feb 2026
 09:09:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz> <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
 <jqgwmjet2ncit5bqilvuqldxrtcapiozmpbk5klc5tybwbfezi@4muxgno7do45> <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
In-Reply-To: <599b42cc-02de-4430-b09a-3316677ff541@ixit.cz>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 19:09:07 +0200
X-Gm-Features: AaiRm50Sx2_n8DihOL9hklXJdrc8Du7OFuYU-F2KAYpfUdG7jvJfCQgmVGzeJ0M
Message-ID: <CAO9ioeVTyoG52=5TRFC3NJqKODXD5eGcpTax9SgCK3b-AznH1Q@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/panel: sw43408: Add enable/disable and reset functions
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        phodina@protonmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: z4da_rhcMBywY5wYEUAsB6znA9PKSkrX
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699c89c0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=im9cganMwkklmwY8314A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE0NyBTYWx0ZWRfXwMENSrvceKiQ
 CKs6cjIdnEhG07kRMJmlWYcdlmw6ssh/o5BVUHr2YEG7d7RpvpzyuM2CmiO2XxcxsKe3sdfWKvD
 kDQpPTHiStBipp+Pggwag8Qe4IaRLMccxZeeIPKw7QcrehuSyAniDZCO6bjWKH55ZYIOhPynJnT
 eQkv63WEjdZgYHsYF05c5Zfi+lGlkV9I1IVJzPXtU24+qkyuGJxcQVsbxNV/Us0ygY4Yllb97lq
 DpNXqcLLjK8hg/I6xP4p8cLJmRvzQVObVTtTYmC94vAqx8hzGT6KxTcs7jt6cY3WJ7ppgqSd71d
 8G7NNC5VtxPXbthFDpIy327PeerWWmeVtUDLZSpm99CPJZxy/SY1FrXRA0yeanOJI1bX1kXx2Jn
 RUlTvJkm/r7VOpUjFnmLlFUXdNYQwoMyAXINoKZl2+KSDRLYSGmPfma6jb4SSSCMCxZqxbzgSAn
 vEuSv2K/9fV7q9Bqwrg==
X-Proofpoint-GUID: z4da_rhcMBywY5wYEUAsB6znA9PKSkrX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230147

On Mon, 23 Feb 2026 at 15:40, David Heidelberg <david@ixit.cz> wrote:
>
> On 06/12/2025 05:25, Dmitry Baryshkov wrote:
> > On Tue, Nov 25, 2025 at 09:29:39PM +0100, David Heidelberg via B4 Relay wrote:
> >> From: David Heidelberg <david@ixit.cz>
> >>
> >> Introduce enable(), disable() and reset() functions.
> >>
> >> The enable() and disable() callbacks keep the symmetry in the commands
> >> sent to the panel and also make a clearer distinction between panel
> >> initialization and configuration.
> >
> > This also makes those to to be executed after starting the DSI stream.
> > Is it fine?
> >
>
> Hello Dmitry,
>
> I was wondering how the exact workflow looks, does this snippet reflect
> real world?
>
> - The path ordering should be :
> - prepare()
> - (host/controller sets up link & starts sending video / enables bridge,
> etc.)
> - enable()
> - disable()
> - (host/controller stops video / disables bridge, etc.)
> - unprepare()
> -
> - So: prepare happens before the display pipeline is driving, and enable
> happens after the pipeline is ready and stable.
> I assume in case of poorly written host or bridge drive it may not work
> like this, but in general it should?
>
> If this workflow is correct, would it make sense I would incorporate the
> phases between into the prepare/unprepare kernel docs?

There is a very precise definition of the DSI host lifecycle. Please
take a look and notice that for DSI hosts there are two different
points:
- the DSI link is started in LP mode, letting the host send commands
to the DSI sink.
- the video / CMD stream is started

For multiple reasons those two stages are separate.

>
> Thanks
> David
>
> [...]



-- 
With best wishes
Dmitry
