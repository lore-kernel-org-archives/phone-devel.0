Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF9335DD02
	for <phone-devel@vger.kernel.org>; Mon,  2 Feb 2026 10:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770029845; cv=none; b=LRMtv6pDAaj0X0eCDKlzygTae2XnQY7LetJB8TQVlC6EImZx9IBHciLkTNErLHzJKmb329ZGGZc2gisWAQnrVPNgfS+kpawW+71H5/Pc40ilitkXu4EEEpvImKAXrR/TDoediPIf0HqzY5beDFrJpov+Mc87D4CaeVXrr+jZLfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770029845; c=relaxed/simple;
	bh=TFTxp9Whu76WPWc8LoRr1IbswWOT2EZOfWCEsAXG3cE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=muaZ1HChRcvp6Wrs8bVX5ydDAdn46iIlawg1CHZrwkg16ANS1pvN+sQrWdGdMO71hA9V3uDIu0K6cAdTWdnvrHBr/E2tmeCTm1uLo9H6gESzmf0eQtq3fwMoifwPN6nEbiYZOeOLU0HF9hPSPIyE0me4eveeoY9GqYTGyW21Cwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dpt1V3u9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPTVHbo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dpt1V3u9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPTVHbo5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6127KAUO2028246
	for <phone-devel@vger.kernel.org>; Mon, 2 Feb 2026 10:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=; b=Dpt1V3u9rKUpY5Oi
	GIjOPuOONwb0nuY3VNAVkxQHYXLsyznSjcYRh/g8lQmTfq8Mft9pVlCt5jsoOxFo
	RFH2Tya5hatwejqa0yztCYXi82sGp+Q/9C5NFJXRtQWiZY3VcuJrJJ7k/jhTLlT8
	uVbTosc1f7IGFO5gz5p47UG0DyX6w9MgenSLUOs9lalDMPCCChdc3//mvNVu3Tti
	kdly3kRD6R1IfsXWyJ5KtkkYrmWnIbLF+BxttNFvUNMvlOFG9Cek7GZP/qDYRVpa
	uOu4Gl3u8IWYq3Ro4W+nrenvnls67qtvuP2iQVLgc/u3g7ML0x5bHr9uQ0AyA9hn
	rZ5Rjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1awdd4ar-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 02 Feb 2026 10:57:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b48c08deso70505085a.1
        for <phone-devel@vger.kernel.org>; Mon, 02 Feb 2026 02:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770029842; x=1770634642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=fPTVHbo5wUOSfOKVziEtvkjOMOzbXeQDw9tREExTRWFiavEyDUCN0vWQwmo+oVajqZ
         PGenC8zewOi/jvtDoyXo345xS6JtP35Xa6ohAmTOqsAmnLb1WMmnyo2hrcq/Argb2ZWC
         /IktTUWd6gKlsFzPdV1JPSxTLWX2T/0/GAWfMJ1n/ifgcRaoEjGeL1UYMNK9idu6aPuR
         hQ4R0Jp0pajoSYkPo1uBpJXZdacjNlefx+qB9Qy9n3uK7WWYrACnZww/pXUR6C+J3/rD
         Ml758mhJfl2nu+b8wgzfWuNuTbdVWlYgNZT0U82A3LOoYMTijwgnOzN3/d7e7lMVb4WR
         PUWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770029842; x=1770634642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UuulFgRx9rd/kvUwhvAhL2lf6p7QUWW0dftJxb5MCVA=;
        b=Ewd9JYLxJRn5afYt+WmQvWwVm8a7EPKoJ786uCqNFY5WvHSRNX9K4PXgNOEBXKlykj
         fHkXCVPpseyD1zN5l0YAEH0UsJUSELmaNDYr6hMYr4u2ArxdumjrP0XWw0z3BCPfq5uy
         qoTeVjyOusL6Px1bM+xM5xxPlwNYQPQKEh6UUI5a4eofiMhrZlUJtJIbpZbcAXQZI+GD
         ZWphghfr8ysno6rc3hllXcjawUq4i2cb9QdYRhj/ccc8hlzqdEm4mOcm2xCON0wyFG3Y
         BqaFddeNWnCmfoabk+T9u2PjNt/I/oqHhF3Wp36e3hqVhv+e64vqEBJ7qt4n1CC9LeWl
         wd5w==
X-Forwarded-Encrypted: i=1; AJvYcCVawzMroseEAOPWKhgw9lwUywJzneS9xtdwfsmvJlovrQroiwzHPzKVEjmIjH3298/2iBZ61qdU8sdCBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW1ODS7nIVYVOZpFwF5kzFcld2zLIiCjL+wmc/M/qlAv5wsyPN
	8MA5vAlvVqs+tTCKEK3dcmwAqD1RCy9QeF5zkU4ersuh+2oS83OwHoYpeHVsttI53ZifWkqtNNQ
	KeD0bbvV2Ks0i6ueZ7C2Z52vpzaWLnDovzMH8aGzVFNmmRnaoi82H8y5tlJqBI8umal6NL8JvDQ
	==
X-Gm-Gg: AZuq6aJUS4Va0B5XP45PsfnfBWziqTkEnrddTv0Np/o3yu2WqPmf50QaXL+Y/D7D+Ra
	AlluF3L8hmKVE1kHSgm7df7Ajxsivt8J7wQrjQJXCMD9R6kc9ta4V+3qXaONrXh4wx2YqMoRtHW
	hGVZVaVEUDYzePd24T3x8T2cZPgYNvxGftP7u+avZFkDUP13t7z/TNUrj+gYQRvr9DmVO+NG7XU
	ReKvORjDAk/uL55cFq12al/ztRBLP8N1KmB0yx8Azpd/4FkVl5QBMQ+c0qfwbnodCaUejaBxpKw
	lsJAEJ/wVM2MllAGQKhqTG2nzH38LapgDflwRJLPcsLY0FFE5rtZJU5up9yIAjnrtGPTiEjgV3v
	a5nVWBISmLbKbu0dSNa2DIkgggFGxxqc/za3isiKaLrwDHhnkKvm1CO4jX4QFZLFNkHQ=
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085527585a.2.1770029841923;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
X-Received: by 2002:a05:620a:4141:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8c9eb20cebcmr1085526585a.2.1770029841519;
        Mon, 02 Feb 2026 02:57:21 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf183ccbsm843100366b.34.2026.02.02.02.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 02:57:19 -0800 (PST)
Message-ID: <9b4ce86a-8529-4c55-9dcf-caecf81e46d8@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:57:16 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] remoteproc: qcom_wcnss: Fix handling the lack of PD
 regulators in v3
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Cc: =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, llvm@lists.linux.dev
References: <20260201210230.911220-1-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260201210230.911220-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HwHBRVpWpJNtHlzQ4-rWWEiFuWuN5Zn-
X-Proofpoint-ORIG-GUID: HwHBRVpWpJNtHlzQ4-rWWEiFuWuN5Zn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4OCBTYWx0ZWRfXwtKtOad+Xw4i
 vXnLrE5RgMNPrIhmyxfFhtz7V3IVK+q3mQUTB2YjvRKMZx52ZR7iFmmTfUCQOPjIzULnv3cCQvW
 OPVXUgH1LAks4anAxzYwioOqrtPJBvLQTHvHZANb41V0lu0M8boIYgo7l0eTuOKWGqOAQjIHaub
 50puu5YVeTHPJu+9qLYlTCv+OLwmmTWlDPUMRrOftTYKHRPw2+HrqMPpwzqagwJwJPm9TIeBvXU
 rpE/jp0mU1CH+YLyZfu+KrQ4kgusC0Zl6iioFuNWKIAlU6SlfKy5vwx+DfIcl2layw8x9a2teTh
 nuTNrgZZJ4LUbS1eoEbFnJs1i/nzal+D3nb3W2J6PL0phg0gE+ArLR/GvCBbTUMNKmBI3D8kmY/
 BcSepTiyUKy+w8U7OifWt9dR9j8Q0IlMmKpluHM1un1DXms+0fr6jPQHgJZXQVSEsT2r24t80fm
 oA1OhK8NCLQri5RDPIg==
X-Authority-Analysis: v=2.4 cv=T8OBjvKQ c=1 sm=1 tr=0 ts=69808313 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1XiK3UaZtGXvnlVxuGgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020088

On 2/1/26 9:55 PM, Val Packett wrote:
> The changes introduced to handle single power domain platforms have
> swapped the info pointer increment from num_pd_vregs to num_pds, which
> would shift the info pointer past the end of the array for pronto-v3,
> which does not list power domain regulators in vregs.
> 
> This showed up as a difference between GCC- and LLVM-compiled kernels
> on SDM632 devices, where only with LLVM one would get the
> "regulator request with no identifier" error, because the out-of-bounds
> memory ended up being zeroed. Fix by skipping the increment when there
> are more power domains than regulators.
> 
> Signed-off-by: Val Packett <val@packett.cool>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
