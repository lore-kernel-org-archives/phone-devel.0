Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792661102;
	b=AW0ZbyraX8LKkU1REuAMHX4ZWG9OJiwV8t3qnxI9ooHX//lU9+bAHJ+PG82CQbYef7Xg
	 0MkHteCkZLi7T06TiGY9s8I3QgzsgTKtHAYD0bMmcffeIWL4hdknpu5AIZlv5qsXlY3tg
	 MHPyfqlKwMwESxBAMb9Aus9a0lypnjCfwgQa8PLFmNHiEB528A/NKH86BbIM1fL22DlK0
	 yrm+mkAScOF0N7cSzitBrfNZ0R+RqWwkdcZ85DbdrTffKjnELlKfWB5zgHasc2i7wOGOq
	 8Zb6ozDvIwbuRp2YLNNhRb7ZyoeJTdziAJmCz14jQ4d4aoW4ReFf0HqtT17Ix0ufDww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792661102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
	b=mlw7vVVbesmL8+YkbO11sya/O6+h+Qt4Kc2V1E4ZKxlq90uXhnWTo0dkpuDgzjVALra8
	 8Os+ir79RKzAs7LD/YUvZKsZMp/1xjsNaA/j8tVqSVbdoWBWwWoxbmHWJIqDjwd9gMzif
	 gzbijFR3SALSOX9s/HgCzv661UR4VV4g0h4LQkt5l/zsUTwRRaDobLU4tBpnrQQuepGH+
	 xUvgyaPP8wzCNrr6PJaUAL6jfcrgbTRebrOyMNlfdx1F6BIP3Tk/tyvR674EZvynInMvV
	 GeKjhjnCx0igKuGIWXgSCE0T5r79EVY764fpcrD7BYmNG1hrpD7/5RXSNIcaJvVOxSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4606606A31D
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4606606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNIfWIh2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y714SOzk
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M7050k1995929
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=; b=SNIfWIh2BD1xA3IS
	9RpYsnwpdP28ajmvhxjpX4BMqNOVJBhdP8kRs40baV2IuGExQd4v4ZIiBrAhZtWa
	3peEUMOVtKhoqpMqdXyZ1wdRAt3Pe1jSPCnwV9DDhTkAtAvE6AzGptZYBAqcHVUb
	cRCsPpPWNsWEP+TrhldvIT9zTccRvAY6QdB2QBJ7hLYsOJCf49+JfDQalYu1wnAk
	cU+mz3ElSZ4rQ/836OPEh0juBZqicn2pvgefCzq3EVdHoviR+yq4G63RoGuQ8jdh
	5CaIYIH5G9cPMkdP7GT+L4ourkA/US0nA4mb+Udrh625/lYY8KxGs+ftiCkhjVj5
	rwHcTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bsnbk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 09:25:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so37288585a.1
        for <phone-devel@vger.kernel.org>; Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792661100; x=1793265900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=Y714SOzkNwNH1ib7eT6zvW0EkbehqGtYOUN3l/Ew2v4InJ7k+mEnO8qRWuN+K6MoKu
         d7jySZnv0O89GHKNTK4+GZ3NzBv9xZh8GUjU3d2GNsdjpzjk+y3ZyT8wFRAqNsVzPb3l
         eTR/8t4yxj9DPohm+an88S/R0BFd3QFDwmxjt3VIopo4oUQbkikCdBtQWBS6C8GGvZ1l
         5AXXd0q8U3XXstgOM0/rh2Gad/9YSqsjPEbn002hB68nKxdwHWOyN4a11NrvMS7iKLdw
         ZSAAYXr8Twi0t2EZ3tWaTOrMWwrhvztSO79TqdCcxT6OFPTucjEnzF8Nc5nJBNkKVriF
         sFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792661100; x=1793265900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Vrffjt343v62WFprMqnTpT7wSBy86fnXWcIeZccG6c=;
        b=m1GC7N9UXetLrVmDS+ltIjRPd7pJTmQmSBfhFO6HvQY2he0MKVeCKVxqekNQlYAlwg
         GFOU2FxJyq3DXH83kKA97ldZXls1BF2XXBeTZguwCTgGOkdSp9NWulk53pZ7XUzz5WwK
         cPAaWUX1pnkL6ye0EIDNFmVhLel65M5y40pV9+yflsJUYkv73YPX0nd8pk9OTEKTXAv8
         KMvPV2ifRXRtKkp65w1sMIS87+p6cKdD7Eqp/ngEk8ZYL1m2h74n1gxfl4RCbAkszc+4
         6MiGhgbt2PupyamZ0mjFjaJApoTj92/E4p8nqk2JLrYVh+iU72LeUmCCx/wVKkKE/tSu
         W4og==
X-Forwarded-Encrypted: i=1; AKwUvBykJPePyaP3kcbhzDJMnDETQA/P+uyjqV8Zos2st7+m4/8t8z0CxBf1CxRSaZE+gIOLzBOg64JGp606SQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJmiK9UJHDCAupsyheb27AZQdvf92L8P18P0C4nnwRTdp5VqSW1
	6qX5fLfY/lfDAEAD2IOgiGx5k3J1aks327Hqxyhw/3B4shyX3ZKzzQ5yuOBiFfE+UapROA5cEc5
	c1wvc0NZ/90gpZVx0E+Y2POhCAJRxw3df+ubDOrIVE/8qYADjDT14e0wqnzDJq7FKmiMYr6VLkQ
	==
X-Gm-Gg: AYBFou13IkFAqyDjJ4PP5wKxb36Jxqmuu/2Nx+9BKh1IUJtYvJePyNUjjkUHwogRK0m
	BcZXk/GdflwI8EjLqj3xokZH/OSwVSFuDaBSDt0UINcU1poUaUA1LwXmc1GWJop5oxM2DoAeBd7
	tv1S04Xt/c+FAGDYG6Qqkp6GfZVp4+sTkFeopMqeGhC30uYn443o88vT+xbIU9x3XRSe3Eq+9QU
	Wa0jRFN736/TSfqaUpo48iZ7XOZkHgPw2FyTs/RUY4oai6ZmJfCGVWvHh9fWd9QzdFxe3ZxJTeV
	X2HUd9F4tf1j+5HCDDSdcpAXcWwHRv9gCo/D1AB4tFGazmb3wMQoeWoSzL0Nt4uNZwSAdqH3z+v
	EfkfjTKauraBZzKhQeC0sfA==
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909631385a.5.1792661100068;
        Thu, 22 Oct 2026 02:25:00 -0700 (PDT)
X-Received: by 2002:a05:620a:6844:b0:93f:211f:7ba4 with SMTP id af79cd13be357-93f57fb9f56mr909629585a.5.1792661099662;
        Thu, 22 Oct 2026 02:24:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130703sm1601567a12.24.2026.10.22.02.24.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:24:57 -0700 (PDT)
Message-ID: <a00c39b1-e993-4cd7-94e5-9bcb2494d679@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:24:55 +0200
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019-kebab_dts-v4-0-bb6db87ff15f@fhannenheim.net>
 <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-kebab_dts-v4-3-bb6db87ff15f@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4tadf3kSY6fBtNMvKAKd_l_k_0nBml1_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfXzXzUtm4yhF/y
 FAzBOO7UYxVAAFwd59C44kpJcX12/OcwXYB9ML9ZaMo8RJNlD3ovD1CmX53SWnwPY1+kgEn8axf
 qS1bpjutFuieOMBqF9XCm8GrT9RQsYU=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9d66c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=EUspDBNiAAAA:8
 a=0q0syt3hQrrWoPH5w1IA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=6aV5INxNnvWGCTbEtcBN:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 4tadf3kSY6fBtNMvKAKd_l_k_0nBml1_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNyBTYWx0ZWRfX9I77q5pAvNIH
 +XnPfAPvr7GwZ0bBKCqqEB6ezWfTKthtegUMhyMqiJ0Ob8DDU1zE0/GYaV2sY+RZI7SyhOs9FOW
 v6WAk65TzQEgh5VwKiGMnhpDxGFu0KAjxZLn2lqBLhyJNzYqsTacP2lqbPSvIXxA5tkI6GKf+no
 Pw8l8kyqSMs1wUNJNoiIvO42OTnX6sPZBM+v0gXN3DDQRvqP8V/xzuBPmk3dpYdOpvZoMIF/eqa
 7mIayGt2txCBLOCAxKUzRXldYNvzOUPbSuvbxsv2+R+eHXV1x/8oo24ISkMHir8tb8KIvnCLUqJ
 ddxc5mr5vF5WfOVsLslijHcClO93IVgc7MszE1QtbY79jj1Op7vTVD9RL0Hp1PBqssRqDgvf4dv
 ptzXmh19TgwklTZhL7Z4L9/ILgoAZqsUTHAOo2Ac0bodEFYEjH/M8LqC3zRWbx0+EOEbisRRgG2
 ULuF90hzCdC+SYYGbwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220037

On 10/19/26 12:18 PM, Frieder Hannenheim wrote:
> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
> 
> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
> 
> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
