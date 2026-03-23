Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD19339659A
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269704; cv=none; b=kPM5komMCjKgGHT146oDlepVr/YxEld9pRjfwFdu3gcfrC4zj+d1yVPMlKNOGJWMh2JR7S2VeTm8FS/zIfYdOSTONut9rTFyFQNmvHsN4WIHum36BeThPklHPMbMlnFxXFfbTJjWMGmxIpczWl25/GiIHrAtNnuWMDPkx4M/9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269704; c=relaxed/simple;
	bh=at7pijiQmc0UKem7dJHzsfklr5nFo712n5Tk4Rm2WQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Khbn0ZOgxa8C2fa0p+EK7FUymZxtZzq59QlnZqCuyen4s/m2FZiGYBClU0FahFZ2gb9NeZdvK+ysyE5gaiHu6UQukOohKKF/Hv8GG9Iwh+aj/XgTonBbOneICIVh0agnPPt52XQVkLW0Gw/glzxQPnv53HK4KTbL3ABkYssCFXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajuX0Sab; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XjUy/ZUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajuX0Sab";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XjUy/ZUA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NCejSM2476075
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=; b=ajuX0SabHe3aggMz
	bfZQ8h/56mKpWC3gKWwTSkE+M6835xHcU/Hez405OoMhxhrkMn3P8H+ElZYcXrmx
	54Bg5Gw3KBMvqQOhwbqmBUZBBaznnsbIKuQSv9wntCQXMN+Xq92qx5WOZcxlNvRO
	aDqAQyiguyhRXhY6aie5CX5YzUacFFVDQigQv8n+CJuS+QJd/pwTfO26lZMbxQxG
	bCpEdvI0E5xEHMJ/qF5uW2WrQHLG5SZmvmLTvrtDkp1mEHHqkbIzaHfFN9eoUhT3
	jgCtjgUChqNKp0U+V/kt9tW4nVwcbYzRYy+gxuJRzLzpu3bRY8v41EfaSfgaAgQO
	6f4SMg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d35r2005a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 12:41:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50943e69b08so34481351cf.2
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 05:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774269700; x=1774874500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=XjUy/ZUAeyOKdxC3MVvg30odpKUI4bVyhYjsWhtPDkcKqM0e93hXkiTHwyNTlcfGaa
         hiBuOD4XcnMFq8aet7lBAbtNtMFzjhpRQeL5BRypof+2Dyi0y/zEBcw3+kIE254qwPli
         Z3z2hseZpL63rSnoQs3gSGsyMM1cmZyJ6fL1q4Q81MTUPzg7A7pITLw5Kby9UdFRVFp2
         4hSW3yUW/r5HHQ/nB/wG2yxr20bsXHJYrKq5tzGPls4IiHT5cnut4ZLgslb5fbqAGcnL
         4Uv6KKuAdMTpPgPux6pWGrHyVcTUvO6wiyGRTa0IGm2N9gisZ7GeElfDWXpoMDVadpZ1
         upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269700; x=1774874500;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fceeTStVGYRU6s5MGa/6a9OW8YWr0UiADc/6MC+3UYc=;
        b=WVb48KWQtH6b5ckEUki6gKoKDG3/+jpcuTIM4vDahnZNGvY2+a91hcs8ZTaNuNRrAg
         Q6Zc2I8qFomsAABDKvWYBJnTolEhMK/d/uTJji/hb/f3k78sY6Vu520X3BMrTo80JEye
         wvcw2cAHJcxCg1LVR9bUdZyCtY033cSZ3ZJqQ7KJLwS+tlbtEWzx8Rl2qEEJOVfpNb5D
         XYlsCITfscB9HhBrKADx+P3CFYFbqgVsLc4uSCg8mxphBlebycOSF3MGrB/8/Q1j8WzV
         Rfv6wieJ4XZG2SJpkTyAFihVViPCcoQJRkdNlJhkrQO5QKhfnb02f+GAPJ5kjZW4/DmD
         KCsA==
X-Forwarded-Encrypted: i=1; AJvYcCXzsGUVRVpBHmxNhPJVgd81vAcPMTPnzHV2hL94wCRR3lVL6DFoWzKR53sFAuj2S6ayHSIR7q6T38+dlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPN4Hs0/2eXmJ4YAGUsOB4HrRfDKR0QFMvZKWAmpw5RbTkM9fD
	XJlzRRcr+12pAgPuljk2EPPQG8zdh2gkeEW4GQWLI8OsS/HusPf2UWyJUsTlDhrIAKjVnVLfx4E
	6AMApEnNUXzG08GnsGjOQRPPuCM5C99wuuuZmCsBApIQkF5CAIpS8aoXbFUI3tDVqRA==
X-Gm-Gg: ATEYQzx0TdqlDr0r9Yk0uLqM+9FMeSgkjOuTBELHkJRz1/EtxIvz0y7vAvIvYJ+sxDR
	YFdZ8OJtt/ySqF/qIMAeAkP69O7Jnpcf6T8yvTDeDOBpSTgjj0D0ftVQ0TXZjcdFHPJZbXQ7WKy
	IiHdf+qb8tF2R9AF6/VMIbtQ5oiTY8VcRMDxGFE4qkJmRMa4tZGdZYeQV+Y6tZUJ+6b0Gd2jbZf
	WS3cAx6FIeauxMyjkm7SLWylUhr4842BDfAHFWWcoOIkUujx/D5SUiCh8+q35si2jD/gVDZqKqG
	VFipXl5UIZxCRJmGWdBh0OHOUlkoTGaGkeDvAvs4f85/RwHPiyrSCXOOcoXldK4/RsrNXgQr4qF
	2ARX7l2cc1vINZbyXsuKBkZym+GJiCK2YZ4LxQne5ycl63G3cCpBpRCHhcWTBYHbiSIA6oRW64G
	Kdnuc=
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639421cf.5.1774269700117;
        Mon, 23 Mar 2026 05:41:40 -0700 (PDT)
X-Received: by 2002:ac8:7d48:0:b0:509:39b5:a977 with SMTP id d75a77b69052e-50b374f7649mr141639161cf.5.1774269699645;
        Mon, 23 Mar 2026 05:41:39 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983365a1adsm485281466b.45.2026.03.23.05.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 05:41:38 -0700 (PDT)
Message-ID: <33d5fbc0-ceb8-463a-8adb-32bcd3e70531@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 13:41:36 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting
 bias pinctrl
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>
References: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260319-fp4-uart1-fix-v1-1-f6b3fedef583@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VvUuwu2n c=1 sm=1 tr=0 ts=69c13504 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=wBgx0QqB7cFJGvLgnJUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: CcPjdlpxemN0uNqmdmD4sLd0ADhOIMMQ
X-Proofpoint-ORIG-GUID: CcPjdlpxemN0uNqmdmD4sLd0ADhOIMMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5OCBTYWx0ZWRfX+ooS3876zorj
 KcGZtbYHQKkO426EjvCD5UPEYVwwXK7rmnlRwJgtksYms6vI400H5jf7idC3eSCHugmE+EqbTz+
 1KqjjZC5X2vfDWlRkuNC9qA45ayQsEVm5iejis9aEApA0daWeZOaMsDFK/2dmaYGWGSE8Ef3N76
 mPcDUFmR4B0PibORx/mhK2AaMj4A49NZF0Ys9ROmyQEdfGCf723SrScYCOr4QQis1r3PfWhA877
 FHfx1SmQ4GL4Xy8EDGxREJc4kC+u47dTrrniJl6Y1PfB1X8CRIsWjzLeR70cK/vNZvdY64+lfXf
 39oxbGxIg5WJem3BEo61x+60rC8s7vWGkKsts/R6PWOJE0AvQ+EeWyv6kxJtky930uI61IRU409
 ElphqkN9noFeRUGTVxYAEIw8vbKqJ8fsPtkre04bun0plpSShuEkxoTGD7JO2xuVtLkl+t24Alv
 s5O8zoHcQNv9YEnXMFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230098

On 3/19/26 9:55 AM, Luca Weiss wrote:
> The pinctrl nodes from sm6350.dtsi already contain a bias-* property, so
> that needs to be deleted, otherwise the dtb will contain two conflicting
> bias-* properties.
> 
> Reported-by: Conor Dooley <conor@kernel.org>
> Closes: https://lore.kernel.org/r/20260310-maritime-silly-05e7b7e03aa6@spud/
> Fixes: c4ef464b24c5 ("arm64: dts: qcom: sm7225-fairphone-fp4: Add Bluetooth")
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

FWIW it may be that almost no one will use this UART for anything else
than bluetooth, so I'm not entirely against just smashing these into
the common DTSI..

Konrad
