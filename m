Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BED242D60
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 04:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339301; cv=none; b=uT7cAzMgzkT+WW/glCqy3NUDYX/8ggxWYegGqW6IhKYy2xN2XXTygfVo4WhyfvG5PnEmvWCnnw0/4pynFO6SDWJeZ407ngfmwhGvHR9wrChY4PVB+fl20zgxbBmrLaOfoMhWpDLxINSymUyVHbOye0OWIl1XHYahWWXEdnWAiXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339301; c=relaxed/simple;
	bh=VtECjHUO3xGDK9B/G9gi6XQmOhondkiYl15lGVWWDj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JtO0Ie9QSY4uluS4q+v0IsLEXfoXyngyB6Mn/kMlH7ITphQYiyByyzhi7SeNt/rr05wfiLyfTfk2D2OhydKi2rM5X04yUh04VldOQg1ExiIii+tTXBlwqWqGfcYv7LTpmQclRe1mUcqcuha/Di92FQogK9NztzyO8RFiTBJWG5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjcHBXKU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kGnLESpb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjcHBXKU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kGnLESpb"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LW0P879119
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 04:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqiK2oV4ydfSYTKR7Zx8jO1z
	t60wSHlnWIxEEXBfXUM=; b=JjcHBXKU77FDyu/9srzsR2eJZHcVGnZAIAVSJvWU
	8iuzpG7i1SzOJhvPML7i27o94CyGCZwxUCIm02Bvq91Ux6XvfqqRMX+XB0bNHyHA
	CG+HY5f3MiIDUlDp701lzkPBa0RabAmiyNuhFe8mMEnNH1NqS9MBbyxGnFfKs9DW
	fLaRnL6EX9i5XfLdgrvIoqBI9eIk9ffLlbkoNB4IzfJ3Eag55Ywy7fS8qy4G1auN
	PIddMznblOcGAbWa0I7qLkBIqhx0iZ9btO+IChPDGsEpUaa/XbW5QJV3mwCknSOS
	WZcmmaqYTWL1HGtClSBBDa1dKZWjep18cmk1qpysenY4Yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axp4vtc31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 10 Dec 2025 04:01:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee41b07099so78114491cf.2
        for <phone-devel@vger.kernel.org>; Tue, 09 Dec 2025 20:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339298; x=1765944098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqiK2oV4ydfSYTKR7Zx8jO1zt60wSHlnWIxEEXBfXUM=;
        b=kGnLESpbrPl8BuTREg5cP6f0Xp4dLhp+Pe8VEqRbNvj9MnBTRQFarLmKCprslgyS8v
         qSGqwfHHHcLCCt96AxzcAR45i0+JkRiDArjHPtjNluvXsCpLHwEFq61hS67L1FXOvFqi
         BJKe3QBMtCXXRySJAX8wmFX0CfaZostE6eK77LGW/LmeU3YAmT/fso1ffl0Sy4MLEk63
         nzqtVGJEwpASuNwoSmX6w7r7jNZ6vOcSBpWDQk83OgO+zrJR0IY6orugI6M3/H98PLTQ
         v03F/UWbiyIWqVr1WjwDAraOyyWAe+PAZ2cO+GKSKCJewZwii8yr2yEGuZj4gKGSDkSP
         0nnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339298; x=1765944098;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqiK2oV4ydfSYTKR7Zx8jO1zt60wSHlnWIxEEXBfXUM=;
        b=KhdGvvh4toCmjOVKGJGumZxnyR+tglMsVd826PI47Dvv3LxPN8SaUZKw5ICcCM2ieP
         Cz4L/GbD37yFcBh0KQwYuuMce9hJoqdIJt59d0fxCKxpWexlhdEbSYLZJ7uI7z/XOsU1
         /63dJsJCv9Nrpk9EwCN4R75+POVF6Loowk5nrv6vbAvUuzju/eJrd0D3Dmqpz/7YFtbt
         R+0qWXj95oLx9+3R4lVL9bHPzdzDeIJZ8JVK775xH3njAKPUH8tLnNpOwnYdWPu1Cblq
         3P7tJyD0l8LcLJajzNoqqBqq/N1wUCXaT20IO4v/7XIcegQ56QIuIeVozKxYxCCMpG+T
         b0AA==
X-Forwarded-Encrypted: i=1; AJvYcCWMJMxS3/zcHaXs0szdgTPaDqbKavmn+iGs2IqtHI8yPitn/0PdfiNQDOwrXBCPDuVitgXkhbljYz/mQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUYZKWJokU+zoqY9p5yphhCtpLjgxZoIkOzKjFlqQijg1q6Isg
	/HJnFFyamBd5HeFaBELK/wkiujeHzKj2y2N50RwEfdkk3hC8HhuHc5hHmgcf3TVqrv3Q+u97CHT
	NbPu51eA0td+G8+bLBQ+uUa/0ZkwO2sDT/8GZNCANrAM7d7Umr7KKOc4AYVYcgAKyuw==
X-Gm-Gg: ASbGncv8twCtudhR6wzFd9hNwXophPyXHLcwV9R3y4jDR3fsa84RTjT4YHT5BEKrn61
	xSm1HGRRNklalTibO2z558s9iMtZlJPTV519Fhl9XMNM0zuoQqG9qrAMUHtZFjq6WfQipKAF8WE
	Xz3DbYWISLEFR/63toQt4OVYTJSW1ddnZXZQBxlpuj+DIAgYCOCLeVMxud3TO/mHCgTECj/kIg1
	Bb8mDKj3EkSIj11/7Y8KAQi2C4mPbD33ZysfYG+MNaNf4+NPfooQv+A+Vd5wChfcOQz8wwxRrZq
	iRWcIvYj2U8suAJzJ/Mi1hbb+ST/dbhlCT/gZzw6yfzK4WODvMKJceYbDd8Pzg3slW5IrTRHo3S
	RC+4tC1DuFdo/atFqJrzpnZhGENapUaPtsixZeTwbplIIAmLCv3A2/PjtV7MALL5QE+L/Uqfv3y
	/7yTuz00eRvkNs3+tdS5BHufo=
X-Received: by 2002:a05:622a:188d:b0:4ee:2080:2597 with SMTP id d75a77b69052e-4f1b1a846cdmr13831261cf.38.1765339297434;
        Tue, 09 Dec 2025 20:01:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFR6q8iXUcqUwTpaJVE3qBT3yDxxuu4wFZVSU6r3pLHR6MDtUDQJs8YgKtaZD9Q1cInJatE+g==
X-Received: by 2002:a05:622a:188d:b0:4ee:2080:2597 with SMTP id d75a77b69052e-4f1b1a846cdmr13830901cf.38.1765339296829;
        Tue, 09 Dec 2025 20:01:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm5946794e87.11.2025.12.09.20.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:01:35 -0800 (PST)
Date: Wed, 10 Dec 2025 06:01:33 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Vinod Koul <vkoul@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH v4 9/9] arm64: dts: qcom: Add The Fairphone (Gen. 6)
Message-ID: <ysncf5bdxklhcuvxunmzd3gudx3qt6oq4ihzip6afb3fg5z27s@eonocdzxxw6f>
References: <20251210-sm7635-fp6-initial-v4-0-b05fddd8b45c@fairphone.com>
 <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210-sm7635-fp6-initial-v4-9-b05fddd8b45c@fairphone.com>
X-Proofpoint-GUID: HEzyxvQXnem5hIjJOoUmMjSpzWmRTS6X
X-Proofpoint-ORIG-GUID: HEzyxvQXnem5hIjJOoUmMjSpzWmRTS6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfXyETQL7UgAXaE
 yezJRL/l28yUrbvVvY0OUQByqVcZZFduhhwUwqFX4ZalOVqinCLaeunY03l0ZeG/VYdepPttTQT
 YGkxdn8tDH2CTp+LukgCUhyGK4Xm2IkCmFsxCroJn9y8vouxyeBoS9TiUJCanR6iTibqXPJ+sWA
 IyY6L3lU1Uq9VFX/9Je04SaleJkVjuhO9jVogyWdthoeDi/Wk0sshOyP9Kil3fZPC6SzR/Lx49s
 JglC1wkXXB1ae6fpb6em+XlhOIhJFmznRYUKh6WLgLxKjpCnK4wKA+o9kNnH5SAC9CEdKwXM9Xp
 xJtQM7JS2eiZe9HNzPPAl6Hx9VR0fUkj3RKk+jyRxqKXVBoNlSNRFxJTHMWNaRxMYz7FFnVdWR8
 5rdKoFjR3ovXWJZKUIX1vqejJZTtAg==
X-Authority-Analysis: v=2.4 cv=IoYTsb/g c=1 sm=1 tr=0 ts=6938f0a2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=9_MgF4w4W-WW1lAcsO4A:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100032

On Wed, Dec 10, 2025 at 10:43:33AM +0900, Luca Weiss wrote:
> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
> on the Milos/SM7635 SoC.
> 
> Supported functionality as of this initial submission:
> * Debug UART
> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
> * Power Button, Volume Keys, Switch
> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
> * Camera flash/torch LED
> * SD card
> * USB
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 790 +++++++++++++++++++++++
>  2 files changed, 791 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
