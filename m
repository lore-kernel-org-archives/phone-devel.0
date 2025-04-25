Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50421767A
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607018; cv=none; b=Nqmf+dHPXWPGtyniVcD+iYalJ1ryhn16LlnRfSJOdHCqjmiCWwmn3wTFL1AB50XYMnfnrnQGm9+Y5WQK6qpfltL+mj0sj/v9LMr8g5N5Ts9S75FQ/OYbA+bkq1Zxzz7FHGAz/kDzp2CmTWHSBLeVYh2gICw13XXuHYVcNA1dqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607018; c=relaxed/simple;
	bh=ZHIaZASxMUQuBW0iW22VDvjKTjRkFFMiAO3zdbIVRpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKNOTVUsf/0OQaLadyE6+W4pI0S5aFRg7tCIT+YtmGe0H/sdZNIu3mxtqp+sFzntbCJE+hxDy0fKzRf5qPjkfnuOLcwtOlhsCK/lsOaXkkdkg2BR9SKLiHffMhuCt7lFDqw7r6UZPv0EwVt8VNQ29iigTPbzSxUKFNKEktYLXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feEe+xp7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feEe+xp7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGL4Uc015294
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8izVC8iekKJRn/bWtzHXEEE
	+VzixKRL8kJzvIoZjBI=; b=feEe+xp7EdlvGuWAtYa7sLIEXSmu6CPK7hjpaRWh
	ab8zrin5+FbqPXkrdRHlmb4gFnL3skeoYeCvK5pmBEhlnPpuVtVQuS+C62byJErV
	gAbX6i69/jxLn4td1E/rbL+u6t7hSI6z60W2BqTsdBKsjAZ/MjZWWfw/8RBUWBjO
	oAmzjFNQlwGHYe8Zyxexh4Cy0lrKZeBZAQJmt/XAwmg0BPL3WzPUIa7ImrRLPblK
	nMFs+TfCrLcAGkfOEQ5xy8jnP10Qnujnluv8Ypat9I2akotX1/+C8PJQaWxxcLog
	Fkjg3y4A9ZkSyn+HbQOMgWjUrPP4Vqe08sf8/oIjA9kSsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1t2rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c955be751aso419725285a.2
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607015; x=1746211815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8izVC8iekKJRn/bWtzHXEEE+VzixKRL8kJzvIoZjBI=;
        b=sytQf4RnmkLi7yvvDTCrcFXJULBfbuht/e2GtyJW3gPdm6JTQ/8ARUdvLpxj9FubAi
         hnz99IQSAPzeDgbUQYakaBGxmZN01t39yxV7KMlyK44NVYUjTaqP6jMZEd9+wdeYh0nE
         milnj3n65VX89/9bI6Y8wELeZ6akfiGNXj4KrKi+DV0YaE8a9VZlLtILsfzGbKEipuJD
         ZLED98JEYH6+BEoFk3ZlrATvBXPVSGoBPPz/QTZlp47xi27WIdwqHohyK/zcwaTRvvrZ
         Q/SFlJEioaO7tH1RHPVPmslxO7UqPuEm9TVi6EKfq3Ej7gshXwRno/UlTKVw6l1xMQgx
         3ysg==
X-Forwarded-Encrypted: i=1; AJvYcCV95EQxfq/yl+3f6eMMC7V2VZ+2Q84KD5iczpAcydYf9UZqLmM2yZjo2L1EO9KZU8F/icHIFsAgmFb9hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9XvtU+KmkyD/nVcy7O5uKO1PcGJdJdWaojnWhku3hF5/V+pdE
	KmGF+5WkbiS1AG7sPms4mDgmDERCi8c6BX6hW3NZiSoYdqDh00dfKV8D6MI9kcS29+yLiZg6Qqj
	EHfC5hJkEoNENTvlPtZIIZEwvRDAPAhP305R5k6FkjDoTpJGtnXZF6pC3OJN12A==
X-Gm-Gg: ASbGncvs4FOtZ3onjEXvVKsHBmowsMGtscVRcPP3j8fiyMtugMwth1oiVf8DFrEiln7
	qrj+5fAj/umQJI+PgPbf1sA3UqU70nJ+9sjxoG+omzT+joaoJOje8pecrBUaCZPA8x51JNHGt3w
	S+ixpfUHpIPBNWgFSVXOTrgAFEuOPjclM7ZMfKpvU8yX/lyEIo5kKwExA6ULfgGjJ4clMcH8Xun
	IL7RbLLAv4GLgDHrjTWmSajadkrcbg4atiOLfQYd3GmcCIv1CDRwhDNrTN6Vgl3EiDM0JV/pamB
	108sNGJdppwSCNH7dz2KhTZhbskbIQqNpXs5NZfngz8/fZopoE22hv3D4+uyfEKY+yp2oZjLVvg
	=
X-Received: by 2002:a05:620a:414f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c9619919c9mr458856785a.21.1745607015152;
        Fri, 25 Apr 2025 11:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhR1NZLY7BGC5Mfvlo+SU9zIgsaWaKu0tufB1sLU7y11Gxi8SqjznxAoySupZ+VO50OAzzvw==
X-Received: by 2002:a05:620a:414f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c9619919c9mr458851885a.21.1745607014703;
        Fri, 25 Apr 2025 11:50:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1c9007asm8488531fa.110.2025.04.25.11.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:50:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sdm845*: Use q6asm defines for
 reg
Message-ID: <cgb4aiwqjxmrcdgcrujk5nbt3sebh3ekjudgcchlmbye6pqtco@nyf6ulfnvnwi>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: S1joJCOBkG1-X8_D2GvtEsFE_OPMK5jF
X-Proofpoint-ORIG-GUID: S1joJCOBkG1-X8_D2GvtEsFE_OPMK5jF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX0ChX6Vxzg46+ f3hPJ9ODk6gHvo1CyItWvsEq51Nu0LOmkX95tvQ04brCsSKTJsx+XsApzyBCUuHjivF8nfDyAL3 83cERFBGih+e+IANMmfimPKheBYP7tj0HjHAX2SsRZzMEVcWM9wcqgjGzOsVIe9oIsQe30f4ejb
 BTSWHhkTVJrYDvnxSBAZy0oJqo09aMtoaXmwnGvUptdDgKcQoPMrEVMqbBnUwQO5mX0zjKSuclG Y8YcQGhlWi43DHVoqd7/tpdLo2s/un33SqDgAbAm536SnfIxPGMW0is/Rb+mVXi3pLHEg+IvbFp yYqBjLX869UrXVBtOicaofAy7tjc+5/RLWnSN+g8sWeDEfEBFtLrSxuDV9/OUbSo6wwjxawcrgU
 eVcBQSsv7HAommKm9tergx135yt+dS2Q79587lyTewEq4oKnCTrq0OMxiqVpei+XxN92eRy9
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=680bd968 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=618 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:47PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |  8 ++++----
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 12 ++++++------
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |  6 +++---
>  4 files changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
