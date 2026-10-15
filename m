Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BE140963A
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055820; cv=none; b=FguDZsm0LttL++Uo6vO1rRdoG5SUmgN7yfIZA8UxyGtnRWqJEIvhwQWuO70mEvqI1rPvlIECMnnKICqNraLHu4ZHiZ5oe8YAW0VHSFKKVCrhxAsljy84eAb7IbqdO/QmUi9mxGh9HBEeFsIfwPz48h5RJvoMDoDqrec3J1sRamQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055820; c=relaxed/simple;
	bh=0HBBKb/hxr/TOT1J49xGL57UFD3h22NiK3c+pzHK1CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nRGJjKDUbaGePl2LJ9cmSYcO3THbuwSH/+etn5xKiHoFyCaRQrcH/P/aSdHvoOUBoZZ7zxFPKadGj/Mz3+d0rT8WO/+/eoYIttSzf466cnoDubWZ6l4FLqz7tsWgghiSjUQ7isDXyGrCOawaw4fOdyarHJkn+TAh0NnlBN91Et4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hFD9JYoG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoXYm4hU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hFD9JYoG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoXYm4hU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6kiNe584763
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=; b=hFD9JYoGNjy400aW
	2inXc+iqUbgUn4F1Kda1xJUGQfK5pBGxxrlUU7+GttiZU6aNunm6++qYVI4zaVeO
	JY8qqSEgtbes21n5oWqmMkZg+uTuGR1lHygIoqTqgdNPTNpmsaiAq4IQXbM7qis+
	VyrpREt8hsA4+R0DPO/u+JYKaz0onPvM3susmUSPQd/ij9ARmJl8HjcMlQ/vL9Dm
	Dcu0qK5Fo2FjH4b8U8S46y+XOGv5lxY372OlDDE8a4D1kh88AZ0ABhg4bvpEAaOJ
	gpiPzTegYbrBAuqBYx1l1ZOhXNMiusd7eORhLKJihr3MUfAJoZg39deQhjNw1Jkg
	2L6gNQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdet1xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 09:16:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso75612185a.3
        for <phone-devel@vger.kernel.org>; Thu, 15 Oct 2026 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792055812; x=1792660612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=;
        b=RoXYm4hUSBW8mHyomjYR5yh6s3wk+PeEGAglnRoUswltup0WaSg3KwmvN7US6hFf+X
         KYbAaWpxqqsxQ8UoQLPOqxWZyZSiuaAmSuje6dnfwjpdGfGfCWh/I87aUegqcTOveKwL
         zNBG4K/Vq4od0DMYNVGBXsWhhCKp6GcFbpYCPhhWRHxr2UW7Q8O4bcUFUEuLxEtdeaPU
         gdXEodkaXvsbUCSVzmggANdDUsOpDY4a3dhCFiGgZ7EM0ysjmc/8UJusfK4Flihj39Bm
         fNZ83vBSumQeldpT/WtgDfSJ5cc9TtXuKZ8yRqLMmRsPzNNiKAsfGilkTGTxO+t4qViu
         Z26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055812; x=1792660612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rEV28MGRovYUyrZpyFq8tlPu9s3MeeDYME+udyPeLs=;
        b=K3NYcu+y8i/k5dwzfjn15FAFeyuUe2iV1sJcqYGpZX+XU/lYNTlmLjVLDFuHBFZ+Ip
         RaaSXh4sgUnWVub71S6pMAEvM1iR/+Ocew4PuMHH/qK8Ibyz3Uo/YIRXhVz2hg8SDvNN
         vQeBM3hizdKqphXyEwOipKTBIvJVHxi6SRvfxIS8hxxaYK8/o7zbRB04GtqNmIYxyEBV
         fthLZtobjH9ANL0PUCCTN19jlX53bFHwkuwAM0xlY/cJHP5ebFUILkbN3r2JqzQgDNgq
         S6fQ/IxNaLoXGxb8HZ4joCnBzDGVrnnkxuFzQ05uVglk6/ZH0IUsVJHxO7lvuXtReHVL
         NhaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFyhpAUZNpm7aE/r3dHfy79UWcahhUjvFRRjn4yQf1ap2nOEY8AO+0bP8daEq9ONixRqAwqTaJxK1HAQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwhLYlFxoJsmiinVM4wV5N66y2wEvOvOyqgC5QdnEiRRP4YUcc
	u1kKcikaI5AfphZjdUUF8m64aG1WFUVEGIZrOLkJm6pyRivy15pO1qJyvcbb4XT3a7wRUZjxuaQ
	nRFdTGey+/F7bMm6Sok7/PaI+v27hw1jeQVLGh3oX4Kml5mr93lNe93WP62eXv347Tw==
X-Gm-Gg: AYBFou2jzVmj4pCTxLy+8MotnIRaDZZS6zFM8uBmPAExs/RZ4fB8c7TXwIeMJdHV5vV
	+Zj0myBMiUZ0n3Qo2Qy9dac1EzQZFr117gcLWz2bo//LLsrIpFBgIPbkg6TuXSqdbluUjbufPiB
	dALfEYuNM0/KinY5iDmofeQ5tNKbLr8RmhYN1QxaKwV/7JcNyTUrrZtjP+YMSefzjT3V2OLUY33
	mTW6UOL8cQC2JresBShORvBzP+eBH/EWb8ZpriYNs1VPPcjByf4nX569QQz7lvt/RwsM5DUUVuY
	dfimvE4XBVkVtrEw0iSfYxWClfXgp7hJPLl2RzF5nFCO7aKZ2U6ie/+fAgNPBb7dibYkr1Pni35
	9Fl1vHhvHifdr7NL92DZ5bg==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3495768885a.2.1792055811977;
        Thu, 15 Oct 2026 02:16:51 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr3495765885a.2.1792055811430;
        Thu, 15 Oct 2026 02:16:51 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda13e80csm102304666b.58.2026.10.15.02.16.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:16:50 -0700 (PDT)
Message-ID: <1daa1740-2c91-4ea3-84a5-7f256ac0f07e@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:16:48 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add OnePlus 8T
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-kebab_dts-v1-0-1fee1204a18b@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad09a09 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=WE8o4AYwAAAA:8 a=ckyZQS8oqhpWkIopcVwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=6aV5INxNnvWGCTbEtcBN:22
X-Proofpoint-ORIG-GUID: r0eucKHAfl0D6X6qTunGfrPp4PfaRoVC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX7Jk2uwAmS+OU
 NCVtBbzRnZ2hpWQ5WZJGgROhECjQEWd/a4fMwlAMQlSyDk7N6SIqQ860DXDfQ2UIGiOUXuCTUj+
 7jvTO1zi/93ptmEST8IaHI5zejzc2HWiQAyInNSkfW1S1jG9Yooq4x/+2CncSHE16r2eoJKvlfW
 SnjcAym8B4vbpV6O8C6dw6AkFDocdX+54tV/srw1910tdfuOPtowgtB3EYTdl9uj9+HEQDgcjfO
 ZA9NYOft+7Wv+UGGJ3wnlMKSpBJPeuvXGc3fHHfhyD5D2c7pNeI0s+ainBWu3vwOvd3QFatRDeE
 MmzGuYyZmClyBUqJAHZKvzITx0+MCgzFUxuKVLaYv2j/ILn29ptiBsACiV6Ek2fQm8oiLX3XpVO
 DshWIqgi+ZK8Xk+OSQZ7nliCxXV8nRXK3Nxokr+hcFcyPvqZTew6jUaWjWYAttRU+pCGMN8iipK
 GudCAnxyeHcUFb8tecA==
X-Proofpoint-GUID: r0eucKHAfl0D6X6qTunGfrPp4PfaRoVC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNiBTYWx0ZWRfX0TTdnabBK7Zc
 dMPttzfVR5U03yN5P367Oa1WaEdws6axlJczEYeKJZlr+hDqQDp7zV+0twXTgM9/UMwEQsnGUjZ
 KnaWkH/1mRijoP3Gl5IppnaiYANwbXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150036

On 10/15/26 10:57 AM, Frieder Hannenheim wrote:
> Adds a basic device tree for the OnePlus 8T (kebab). Common
> values for OnePlus devices using the sm8250 SOC are defined in
> sm8250-oneplus-common.
> 
> This basic device tree brings up a framebuffer, UFS, battery monitoring,
> volume keys and UART. Further functionality will be brought up in
> subsequent patch sets.
> 
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---
> Frieder Hannenheim (2):
>       arm64: dts: qcom: Add sm8250-oneplus-common.dtsi
>       arm64: dts: qcom: oneplus-kebab: new device
> 
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/sm8250-oneplus-common.dtsi | 618 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8250-oneplus-kebab.dts  | 124 +++++

Hello, thanks for your patches. For DT additions, you also need to
add dt-bindings for your board and validate the resulting DTBs,
e.g. via:

make [...] CHECK_DTBS=1 qcom/sm8250-foo-bar.dtb

Konrad
