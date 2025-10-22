Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A838320A0C
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131964; cv=none; b=ZRh9Q3hwU0ikA7o/70+QY68Bym0mGkz6wnVHhTmKwM6CStpB7gMnchQQBzLZGBWPoPZVzyNlVh8/gaDLJfm1GzYQ8xn2cjtjxiqrdZXyR/rEmL0bBO55/ObR6K/KITH0f07ZkmCdQSAE6Ox1QkgoqL6xRmXHOanr+qb21CrkK3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131964; c=relaxed/simple;
	bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RwXM6ZjleVRUmrlNsKoP0YYFVTJqa8FHsol5gloeaVm34ndqFPfdDBBezVfrg+Ni5Vh43LkOK1zBG/RCGa+9noqvFmcEPV0OhhrA727RpQ3Cn1D7ia723B33txrrz3RYlREWOu2DMciPInAaokBQ0XjZiMFZGtFff7q1POIm54k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BTXtd+nN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BTXtd+nN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M9GCtf005518
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=; b=BTXtd+nNVNpr1wMx
	klsf0O0myoX/Eh7pgTzydU9l6B7RNlKHy1Vv80wlAlf5KbO5TAGkUotzYZ5vIPxA
	5JkoqWydGseevMrTmvw7WZQb2zNcyxziwNa9EQwjcSoXawVJq7laeG38d/OSLP/V
	4Gz5tvrBQLRciqMMyebjJTAi4MvFOQSj07bNy4lkEQnYQ84+BEN06bFRYcmV0A9o
	heBHEHHdeF6sRbd6vJSiPYfJElyS8aP3Ba7IIMzfrpX4IdZwPa1yfkxhm1E+Xl28
	BqamLE3BBEbqUHHdFE/NOqFwTJuCLaizgifVSpljn1uxSxNSNEbqeEWXBXF1mBuu
	jXCDLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469mc7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 11:19:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e887bef16aso3193221cf.3
        for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 04:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131961; x=1761736761;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZFit2eOHNjEEsjBju9zb4SqZsQdMWbQEVyan6gONAc=;
        b=ODjdhgWIkrXGfAZbed5byWZoB5advbobvHxb+pn9vAhn/F2wg7IgCU5vMQnX4rH7Nv
         UpupTOCkyr/8+86B4DPHMne5EYuJyORtC2mKHL0BsgUxxV0V9d5Sqru2sJCp+JdTvr6P
         HgxrTjuljr5PymZDftpXOZ8YKogsvENtiefHnEhBhe1rnnqqg/r11TaIGtaj/iYK2KwL
         nUzyxSgT9uZDPsW7OwTb3rnddwlLsSHTNzjmHdKdkXSEbSvlFEiEljA1U3waWjsvl/Lh
         8+Hy/glk8Ir7cCj/lpbD/V/nIIHLxy6SkxA38+QDaoZY7DedSmK91NJb9kGX00tW1jpM
         pF5w==
X-Forwarded-Encrypted: i=1; AJvYcCWwBB589Rcs4l2Ha+lxCjawyZXxVFmJvboqThq///pspuFCtPVCsx2XBt12/RtXoPPUUQbfePBJ6w+L8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3vEKBCkA+yQc3JiwhrdgtgjbhqI7Ck6re2ajdaVO+xPRIyk6
	pzS9LjQHOreajA5pyEeXvfQFuIczexLrxC4zCUDAEq+f4MYP3vLFF6HSJAgr/0d6iTvq06DILhW
	QFtFTBkFfZdYNThPBJKSKTfg2ndByk97btNVjFeGXvTHbFnIKSP0VpN0iuWkj1OTEmQ==
X-Gm-Gg: ASbGncudbuaV21xcYMZywBSvctJUK1clWqC61xXOOqS7wVg80jMx8RBxRzfRRy4I4/+
	nXpgb4VYYWc5ASZRBZb7NKBmpWP0BdKfkuwBATDog6g/STT/7LvanZo/+tozpTILqa5xhDqODh/
	26M8bKqEiflLFLd1t5QEf/Su+VI1vIG1n/XdcIjGQo/8O1ua1CjlzYf5WdG8KFXJZXfJiLqB9xF
	OeGLk8lrRPm7NvxuI3QU4GFIuBOgsMT+CYYG6uF1L6DWNoqqDcKnTJotR9ctziPk3tY49DaVgz8
	lfooZTzwab+v5k1cfkZuaUuMb/EwdO9WlDp+AidLSx5aM2I+hw6s4Zpb86V+zcAmoAtRTNkALd3
	8jujM3N23AKs/Bqb/ZM929lZUJ3G39axVIY/OOkZ5nQeSMzk8TbrserBZ
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460891cf.10.1761131960841;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHazv7EpuQKVa2TE7vWJl88ysZRYLrTeTShK//8fzdheK7Yg9kZVd8M9zY6Uals8F4qoNmYwA==
X-Received: by 2002:a05:622a:199a:b0:4e8:a9f6:359 with SMTP id d75a77b69052e-4ea1178251cmr53460731cf.10.1761131960401;
        Wed, 22 Oct 2025 04:19:20 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c4945f1ffsm11844158a12.31.2025.10.22.04.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 04:19:18 -0700 (PDT)
Message-ID: <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 13:19:16 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ad3Qdi3QYmiGBsASQIrZUegXEPuAyTdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfX38qEx4ykaIFe
 AN53Ikpp9s/TKTbVwJv07kaTB2EfzcRBF7/E9tbMpYdQVcBzp6XBZx1fO0sMdyt85x2hUye0tXf
 njVA4/rVBPn0/md4daDC51lN0+fiCMjUEPkZTvHQ7uw8LLr7/mw0RBYONJn7SBTPq7N5X8W1H4h
 xCglriliK4Bat/i2ggxpjPtSqrL1mOQQUV/u9I1ORIwd061NJNXPzL953XOpdpKNrX1kStDAX/R
 VkHgqt00/t4K+V48q6rMYYpduuqEkk1i0W2KiAykVM5NSgvB9ys9Jyrm2NkTtwLmzfkUib0Tpui
 TjBPyMeOYoLo2NTQM4eLoCqkD6QVp/+EcYlRoMZ1K9qR0aI6Oky9AtnWsEmOBibJOIY7FtToR+8
 3gIookxDlZfZm25itlqhtG1yjrXfEw==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f8bdba cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ElG4cDhITSkplFuxWWoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ad3Qdi3QYmiGBsASQIrZUegXEPuAyTdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/21/25 8:08 PM, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.

This is perhaps wishful thinking due to potential complexity, but maybe
we could add some sanity checks to make sure that putting things in
unused fields doesn't happen

Konrad
