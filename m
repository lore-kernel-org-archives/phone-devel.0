Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C4F218ADE
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607076; cv=none; b=lRjF6zkEUpRzDnUbiBCr/xc0eLe59CcE3attTNxOwHo/0S0exjl5+mwGEqihMx29q3B1aAHBr/nd9QmppJOa3XWOYyGdkDWJWOPbZIPCL0Tjv1NL3rty6KIlq4upyWftWxfd44wYjlVsRail/UK66mD1sKog8fLY6Ov6udC8hKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607076; c=relaxed/simple;
	bh=Xk3Sp6BJoGmDDVZX1C8dwi3cwfy3wAIPSXdwpAs9Yhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JddSKJopzxeqp9KXnQFWEh8blGw+Fw+ntvpEqYJiQaHEn4pU1Rn5Hnw/uFZaG4G6RmVImP9AJTATeNEcnMoUMZ8yCesNEp8EbuXIdWCHB1fOigXWhTkcZ3m96smDIVTnA5SP2r6Xpt67AO6T72mnSJu6hTc7nEzTmEPSuhtcsrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoZMyAp3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoZMyAp3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKMdP001943
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9ycmtWdw1mtAhGHJSYcNQ5K
	fW5PbvOj2z5I1djYv/8=; b=ZoZMyAp3QbpTs1G2QNa5dWk+t0wtxLTj90QwHWzE
	Ah36hsnx/2wV6owXR4Ev7NebAXTosXxKxlut9mUxShTe4Nx6PAeEcgKG0tgOYSmw
	ViTgXURVp+NuvTeOYF4oDlqZTevuYTpAPL28fpVIxoQu6nzWP3ZSWEZ5t7d9puTT
	uvMc97BbPCMMctoKR1vxj+BcUXry4X+Re0Hp3xlWjeFww7XXjwBiJo8SsK7CdZDe
	BxgpSTl0PnFskC/guOAipes8sHkbZ7BpIXUDQGMDjajA66zsYKf4FxSJLFPkcS2q
	85gvO9tse5CJvOuIIsNTAZQyfBWkguiF7XLR8WwWCzV9Lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3hyxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 18:51:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so728710285a.3
        for <phone-devel@vger.kernel.org>; Fri, 25 Apr 2025 11:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607073; x=1746211873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ycmtWdw1mtAhGHJSYcNQ5KfW5PbvOj2z5I1djYv/8=;
        b=sq/PABK2FTCDgm5HJrgkDu2to+X4kGcFfDX9BDbVY+lV8rWyNykSX2VZsw3oT56tdH
         +p/7CYnHwFON/LU9dNyhMuzZpnKu5eaOPNpzHIW99lGtmXB/rE/LDujzYPCFdL4Pu7OO
         uzs0wVwxJ2xuxv2oUPkWOrkwKSoq7Q0Z/hvKAIpJwZaBZyrSXCcOJR8HENywd/nO3IPX
         yuFZffn3F7IiApLBGZpUeFBLz1g5LXpZJBOcgJPzrozWiTddyFMAyR2QLuB7KXCLbKBp
         WMU/IYcKNagDeTyfrtqKvWELxGnlzI0J90+RGlij1GKnfUOjPJnJWBlvo6EnloY/xFAx
         /8kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUDRZ9RWiMfhgiLSPP9NFYtgpFaoCKG88amK8P+QYSPOeINNkhhSnko9Z1VlVoZ29/bsjwj6/dOeQUfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0DPdK9ejXgkeFdzmgoUiycg2k7LMKDGq4EpBKFQ3PXaZ9Ujwc
	I3qVJp+G3H9NcGTSdER7R4shaSRWJ9HZ0P8jAnd6ywPtVe2eGz6Df5kqaLmcWUs5ZIv4twisPP9
	K2dO0hLXyb1oIQcLvxfhBD0eMQL9m6X1tHmAt1j8SPlkI3xfG/bCeIepPu/6VFA==
X-Gm-Gg: ASbGncsWyKGEdfjypjySsv+6sJxB5h++/HKtpanq5YZc8zzUkRWyj7qRBosD1kNdvjG
	x/yqaGJgaATH1Kb0Ab6ycElXLOsn1yfHmpxkSTi3V+oJbBH69m52h2lQjpx7CRud2zpH9L1Sxt6
	oupK9mdeC/5niN/ZMI6MCcA7zbD2r1m/XP0rTTe9/1oDMS4zHOWHOVrioUHbsqJ0+XpbkMRAp11
	FBDkKeHoyI+CFisIZ6lhtVqDKhs5uq0AyNqy5ceYrwE/2PSUSwRcZz2Bn1vIHmNSSZPq8gK6tEj
	tQgktK+HUDEkY7LB6ojlkgJ6Tg8xWyYLyfZvoorq9Wmidvb1f2+fktODhlSdV640zb6Hgx4YS9I
	=
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97522085a.3.1745607072869;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgCfAsOCyq06CGmOi0+/EEgnPyEjUIBFlLDUeeOlp0nhMgAvTxmeVrtGr4SRpqobWUin+HKQ==
X-Received: by 2002:a05:620a:3914:b0:7c5:5f38:ba59 with SMTP id af79cd13be357-7c96684b108mr97519085a.3.1745607072590;
        Fri, 25 Apr 2025 11:51:12 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb258c2sm706677e87.32.2025.04.25.11.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:51:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:51:10 +0300
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
Subject: Re: [PATCH 10/11] arm64: dts: qcom: sm7325-nothing-spacewar: Use
 q6asm defines for reg
Message-ID: <hr3sg23xifgebofy64l2zsybelsbl446c5e63i5s3f4bhotae5@6tl35nmeqkx7>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-10-28308e2ce7d4@fairphone.com>
X-Proofpoint-ORIG-GUID: SPR3k-l4ixBqoqVn1By2AJ9V-rbq_Zvl
X-Proofpoint-GUID: SPR3k-l4ixBqoqVn1By2AJ9V-rbq_Zvl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzNCBTYWx0ZWRfX/1EeojjlS+o5 Ru7p2jtMpOVcidrr2ylOwCjcfWtgyKWXkZQ4VdGiKUbCT1Jf0pV/POLXTMgil+9pswdD8Pb9eoF qN2NUuZuycogDgkz+HLW+O6DAriN9zrRnkWYP7k6696vh1z25WB9by681GtFphgar4k+3ON+Lpz
 dH0x+z09ly+V9DrYywmk4oHh3HBs5gvL2TuOKt9Qk5qS/dIg65uhLQJzYpkTa3uHSy4JtyllRWD Wleu1uwenmU5kW0KvgnEga/vafVx9+1rQn2+R7tkOPUG6B3vsBEDlR/jIhTIMlE+m9bQXH9EEL5 OC8IYqj9j655nT6kt0vkRnN1ecopFYc244fR5Yy+dWyM1fzfKBGOvOV3C2PASlQavuPPxtcmBgE
 Eu1qAt7LQgFDElXP8cV3KeFx/5gCVHzV05sIyo5HgZqKlQftrlCBlYoh5KMzhTIDgpIrmwK+
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680bd9a2 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=607 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250134

On Fri, Apr 25, 2025 at 01:53:49PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
