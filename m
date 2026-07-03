Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E8A32860B
	for <phone-devel@vger.kernel.org>; Fri,  3 Jul 2026 23:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783121027; cv=none; b=Z1ASJikdwljqvQNEbpMtc18XX6NjzAuwfD/N/ZKRe0lTwi3ChbpnYhzk3DYpbdFJQcqWI9lvTJyV2Brpe38wJAvJTe51GQY/PEWNFbLjnLxMUMu3Cwu6ISKDJXtCwk04HARvPBnV9O9i71w5AoxHuAVLRvx/wGZUZtHT7oASZ0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783121027; c=relaxed/simple;
	bh=Q6MpStlpatEJkDy1dODKrw+pHg/8lsoWpNmaJPV+J+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCe/Eiar8g8V7XLOkAn3QJNf6VDJ+V+dEUXax8IqG4/isZerTLpTJsEDXVZLuwWdyFxz2pD9CI1BsUFKib2QDYLUTn7/IRqbedeiTBIx3bSWi4EUiGbkBLkSuD22Ap81a/XShagS8ICEs0GiZO/l1nU+GsubbBvrgrOoczWJ0Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYD6IJD/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQV1FoMO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYD6IJD/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQV1FoMO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbjo1020417
	for <phone-devel@vger.kernel.org>; Fri, 3 Jul 2026 23:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WcTSMA6ScX6zdWc2oJ6SMCFD
	q/6WkQB0iYOmZRp568g=; b=VYD6IJD/pYPHVAFazsqV0p5CfCOmIR2/XXiuz2YO
	Z0h/XjKzvXGSHvxn2NPl9lBZNMg4FY5F972rC7A2NDN+5gF6v6PmJ0oBaGXvzOUw
	Y/kTGvoddBw2llUHfgHqsmIPHN13K7Wh/TTLUSUCSpHlDnkL3akvT+HlapPVCw+t
	hCShGGNSNsWNRY6zNd9tlT6G1gD/lWvJGBg1trbGsmfIAp45G9MYect1UqbAIJzW
	QwTvuwZ3fgcR2YWWKOO9BNPy0UIn1sPExRNZijiJj7lwJvUUl4gyDmBK4tazgU9/
	giWEiOXn3BzJm6ottFEFmC+NdtcNjnYk9RZ/ZEUrM1fWAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6dkkhrky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 23:23:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so153051785a.3
        for <phone-devel@vger.kernel.org>; Fri, 03 Jul 2026 16:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783121025; x=1783725825; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=aQV1FoMOGQxSZv5lmx/U2RslFPssjyvV0qsyYoxDBt0kGbN7EmDLim2rLFpttqZS1D
         Fyh0k5cFBCtaMPfDZhLikWx1fGBMURMY3IJ6eaKvakWR0k4JGLnxmGh0Vg531uiyhXd/
         VOz5nVEsZzQKzDS6X4XJSsuSSkLIW2H80q/RoMrVdPvv47RUFT0FXDHY9N3t1G5XMkQP
         w/uxpvHoDWcNDf2ZSpOnDbFxEK4T9uoaVlFLCLX4X4mmwBlJUES6J5cJGqPDSc+hY3y8
         DS4HjHzmgLVzQg4jUy0sQoQXSr7jhdq6XyfNJryZCAeHuxcZ/ChmPt+OTSJpGgHSZw5R
         OH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783121025; x=1783725825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcTSMA6ScX6zdWc2oJ6SMCFDq/6WkQB0iYOmZRp568g=;
        b=VB74OeLLrD1R9lfNOgQY5OyJgTRvTLUhxNidDGWdF9cgMBuYOZtN7k+fdc2cwFqTqv
         EqnmN7+qd48ZQvv8mmYF2T/rHK3HEbqIR5vzOvau2VMtqKem6sMWfjl5HnjBbkyXgfuj
         WFfs9qmzRuagKR1inYXn1o66XlWC7DfeUYog1Q0QukBG1hKNbVZ7aIzq+WjfFntC/3yL
         3B9UyDOhzbYGD+HfabB189Ud4M53vhfctoI4ZJgEIlhwpJQkLrqwVwyFtiGGJqMvks5p
         JpCjlzoSe4N+vlVwKcNPnz2hfnULvHaLqTb1TFNsGolpF14O1AuxIrmnzfQR99POowIT
         PbJA==
X-Forwarded-Encrypted: i=1; AFNElJ9KU1I3Q1wRZ/RNRbB3H+1tgaBnANIh0rG9GR/C4O75YLVWsoR5PvcgQ6TOaakORYGNUvcwPuO0SYHsjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHvlODsCFYLvV3ElWtGj5fLB+hypm2ACbwvvjtEu4qiGqxxuTe
	QhTDsszmgMX0mos/w+1ldiCeOEtR8qHQHumLN20Rr4Nf6Hd3ZqXQBslji72ylgmrsR4OGFlw415
	W6ybGPP+sT8ZjEEg8oUzkAIbC65GRH6LYOhP7NMvzIWnTiTFwzjdRcPYWdtQhUUiGwg==
X-Gm-Gg: AfdE7clmiNQleI6/NsVukvd/BW7yqf6Mz8t73ZC5E2cQEN4EW8yhc0t4bSG/5o3P9/n
	YJ9TaG/n0Y5ulrYQUBoTsoIwaDwx9965RPtYAcjKA5qVFigxyvZGB2R1LjE5LaUFLoo4GvefRj5
	m8Ag/Ny+uEX6vDpCNct0OH1HXu3wBGAGzWmhuJcbje5eav9AM+D3V1XyJJG9cJCQ9vK8vsxvphJ
	bzj3wltqpD1vC8ox2gGooic1MF2zG0FXIVjRiUzPQ+6IbgeFTG4FVofP/M1c75Dfel5tnfBoNzK
	CCZT5Lcr79npmiZ/CmtFZ3ZNE7o1rfCupR6l5js5U8AkY3bxM0q0/QlPHeq4EqF7HMMRuxqL6z2
	afj2B7dXBIxYG6DYfbz8YOmrCP7Ddtc1XfSX1WLaDJTzbbuHfgqa19PbrG2s7nYZ3BflQ2vIp5p
	13q1CQ9FD1DJUQs49Wy/0Ui0Wx
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200515085a.41.1783121024791;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4398:b0:915:de68:1802 with SMTP id af79cd13be357-92e9a48b911mr200512685a.41.1783121024441;
        Fri, 03 Jul 2026 16:23:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39b4ae36f16sm5168201fa.31.2026.07.03.16.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 16:23:42 -0700 (PDT)
Date: Sat, 4 Jul 2026 02:23:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Vitalii Skorkin <nikroksm@mail.ru>
Subject: Re: [PATCH 2/3] firmware: qcom: tzmem: disable SHM bridge for SM7125
 platform
Message-ID: <mv66rmk4ckke62zpz7wjbbzrxfumsjmvf5bpfr4al6zy35tg4f@45iknynh6rcd>
References: <20260703-sm7125-samsung-v1-0-3e5f752048c1@gmail.com>
 <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703-sm7125-samsung-v1-2-3e5f752048c1@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfXwJcZo264q1Zv
 Hw3DeO/DaT39lnXilw6hX85iVFbBVc3D8VwTBDrI8u+1g5mSzWrZEAcUlKWKdcoPoZpZTF8nzD2
 EeIMIxtl5Uo0BJbBspS8Wy/oJwXojfwXlu/98lrkCvZAgOv3DJQPZ6A/cWMyGFjKaK7NnJnpd2p
 yncswzMLf1IUL0KCPDVBV4e42K+8JxaeG6Ewwvqn/o42HImtBz0oZMa9WLmBcS36SXp4/X7awoQ
 rhODdYGGzBA4ueDDSK+MU0R24Byhmp7I7vpT0jJh+MGYF36CrFS4arT7tl65JZmdxgVESCfmimp
 DaMp+rcg/0DEx/iyhKCj51BUZoDfe2TikStB5CHWrplFJoRifwRQPebV1ZN2Oy9B0bpQEaGkKGo
 Q01mzP6gfuAoK0n8fmLVVzloB7cFPdx87LSB+81+F+Vk9X8hiZI6tlXggo1x8JjuYZNUg/d+hRO
 O670wNcvu02EiUaC4lg==
X-Authority-Analysis: v=2.4 cv=LeUMLDfi c=1 sm=1 tr=0 ts=6a484481 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=RgBw9RmQAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xxd52h_9Px5NHeBr2ZkA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IRZNoaMHH8_KszM_1RBQd0I3uuG7cItJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIzNyBTYWx0ZWRfX1yHYLxK9Sv8X
 nQOL0OHV9NaTmoTXOd2RbkTdXqakaBRz0cv7M18BMXKSYlatujZ//Pvyh23qGiU/V8eFV++hDgE
 RfWfsPy4UvP2oWsyiWZkjMtaJz9IgvI=
X-Proofpoint-GUID: IRZNoaMHH8_KszM_1RBQd0I3uuG7cItJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030237

On Fri, Jul 03, 2026 at 10:59:39AM +0300, Erikas Bitovtas wrote:
> From: Vitalii Skorkin <nikroksm@mail.ru>
> 
> Currently SHM bridge causes RCU stalls when booting. Disable it for
> SM7125 until a fix is available.
> 
> Signed-off-by: Vitalii Skorkin <nikroksm@mail.ru>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
