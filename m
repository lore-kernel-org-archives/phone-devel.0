Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5471C1A6838
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076556; cv=none; b=X175SHw/Ytd0jW8AEmJEOFWeFJZBHrnTBxjRZA8lEiOFZTDdbk7rcEvmgfMg1LD/+K82OiT57zuqVYzZ+kMA3HFt2KMw3wm2fjO32aZPTmQ08q4UQ78bn8kpwihwn/x+3OF03bgA5NtHJ02nwWV39B41fVveaJJ2BA62bBORRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076556; c=relaxed/simple;
	bh=orA7Kl2kyJJ+DwbqeM/sTgHWJlKWLtVGl9tfYIHIIc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LfVA3MjYhPg1hW+QeOd2y6Q76Vq4VbHj5zbif+/DIaGe3XrZupO24xhDQ6Q4RQ5TzWRAJf+BtE9kfTpPCzwV92ovVfyvRXhhFPZZMLQvCvP7nyRmai+OlkPuCKyADIjIq+vcYlD6ifaZX8p5902rGZdqBVCxefcEa+gV8LVbKoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lun4kW2x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaQ/2Ykg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lun4kW2x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaQ/2Ykg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62L6B4Pw1951353
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U2nL8wjs1/k1fQh6HkDKZxrP
	2ZPVK54z09kYBPEcoeA=; b=Lun4kW2xfYHpFg86F9Lhh0MmfqSZxXaWLpXM9t2f
	RYRuxYkgd7QjcB9qCMgViL8KU6af/Iqwz6e3hnQ37JPlZSVDuEy3amC8SZZYBp8K
	LmDzIr6g9/8+/uIlAadD5AIo91XLlq6esIULV91X2+aDHox81q++XwNs7U+GRYWv
	Ybs9vs1VHFpasNVREm0g67E68/K38Bs3XjgVPyLnctpXDIUfYLAgfIHUAejxlzvl
	wa1+VJBGx2A2+WSRwMFI/KOVe2HBvJ6oY99b03GiBxTa1bCem0CjGX89gS+hHQJ9
	Wr9ptuNVSSp0o8nYG/4nte/M5Utxd7HOyvFLXb4Ip7f7/g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jb5gb97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 07:02:33 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5091782ab06so163744311cf.0
        for <phone-devel@vger.kernel.org>; Sat, 21 Mar 2026 00:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774076553; x=1774681353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=LaQ/2YkgSkImz+LaOCkrzLT45IadnFRWbwQGvslu8r0hewtcf2Yg8vjGtc3D/vJcsn
         BsTw5Qo35yJzFUBDOtg3m142dGEAJkxrT5CKBeXR3DW8GmDFf3LCDZW94d1jWl1ASQt/
         1SwbQPZW2aT3okOno7JKpXw1Uhz9QdNj89nwY8F77SGKTmiLOPQ8Kt5b7GHEYVpyItUe
         kiQO4jvZOj0iPQwHF2i9DNZky7oXn9NCilFLf7jtWfwLdH6EDbuEsId3lOfpfiu2TJtV
         Zl1BcdosuiKGnWaSvstJp97YGFrYnoVGTghnjRqsTqvF8aQLfCcHDA4hnRDboHWTcR+H
         xlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076553; x=1774681353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U2nL8wjs1/k1fQh6HkDKZxrP2ZPVK54z09kYBPEcoeA=;
        b=qxoNfxUHQ2P9rrMYsRSD2QCJeAjQFk6/oNI2GCXCjxo6NS30PFOXjF6kzmRwiyjJIM
         GX9WcOe+hZLOHY4YCFax17ID2Shp1Nu7tmETrp0ubDNIYpjGvjvWfwgt/yoEYNmagHtq
         b0/lIPEzSArVNx1dJ8Lhrq79tIZC68AFn5WiSUhJpQocjUyYdpYNrIJUJ1XqDjamw3Vg
         gxaY81SkiiUiGd6DH6zs1xHGXAnDK9vlOYM6zJq+V0jfEK579JelgkHIdQkkS0B9mLqH
         I8z+zWWl5vpabpL+Emr4Go/KNmUCFoR46wKT9qh6Vn+ZdvtudizsCSK/bBnu/qcy9UT+
         RBAg==
X-Forwarded-Encrypted: i=1; AJvYcCX7h+KRLbCCBExVN0iDffln9RtmhgTY0CWhZPmC7KqZdW0yH3Mx+7/3jNXnBpSFW+EC8m0x6hPfG0Yxcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XWsLZ4O7kBLJObb2ilaWO+JbbAPfCD5jgySKWX3M5ALyyeDq
	H7sStss0RT7wm6xKv2PVUL4SzSp1a0wDgm6gulw83db//mL5TjHQ/MVmuczZP5iGTiuF10sYD1R
	5xkR7dpsqvZkFG4kh5zfaNx8xWTAJx78r8lr98R1o3IuK8aRAuvJP+QHAeB1eqrymPA==
X-Gm-Gg: ATEYQzw4L7qu72PuAT2OawcvhM6MXgVmknZOj3+jVeZdoIQZuItBfvPdv2cttQokCQt
	vBi+ZE4HC2Zed5aknT4F1asuyXqmlmKhZCXTuhrep08CpBWVR9zBdJxfo13Xkq8t0rPZUxqBRIl
	zfRDvPsqjdUlp8ynyllK9Gu+DsUg2UOBpkd8adLIm9VnDKlTVRIRhDJL4Y484qPXXpFXJgyuYsN
	4tqPm/SqdtKEztIfXNybG41uY/kmZDG55VYoaAYBUDDcKE5nYLLQcZApCqeOxRcnotOc4ugWXBV
	GtAcbt3njEuPayQ+V1PGD40rIV2/A8zaK1gn0MRVoh5049WIo9Y8jbKYo3XPpKlOIQttNfmmII9
	f4cWqvpedASA4ZtUOhPilSgIiIrlfS29H5mTryNE37sHqPkdpknILQjJGmwDHPWfUCqU3JfPymk
	0kaRE33+cL+1yYWoRX6qCG84/8A3jm4hutpCY=
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596741cf.61.1774076552725;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50b4ad3d375mr12596451cf.61.1774076552334;
        Sat, 21 Mar 2026 00:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf972bbaasm9003671fa.6.2026.03.21.00.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 00:02:31 -0700 (PDT)
Date: Sat, 21 Mar 2026 09:02:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org,
        Petr Hodina <phodina@protonmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Alexander Martinz <amartinz@shiftphones.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm845-shift-axolotl: Enable
 TFA9890 codec
Message-ID: <iallp4dnslfc6udkgqdgnvv635aa3eeq4hexyftljienfxssjh@mjfnc7dhtrti>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-axolotl-misc-p1-v1-3-89c9b5ecb26e@ixit.cz>
X-Authority-Analysis: v=2.4 cv=aJv9aL9m c=1 sm=1 tr=0 ts=69be4289 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7Ovdx5uLAAAA:8
 a=EUspDBNiAAAA:8 a=Fl_3bDCzLZ1VHmBS2HcA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TQZWkJv5rNK5-PaLMsrg:22
X-Proofpoint-GUID: AQSftzRiBXU0nsLo_2QEE3kUyBMB29zT
X-Proofpoint-ORIG-GUID: AQSftzRiBXU0nsLo_2QEE3kUyBMB29zT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIxMDA1NSBTYWx0ZWRfXwmyKsKDuTDJ/
 uVRL1fslGxbKPxiZmx9yM/ttk0YCREzOdq2xnQF44v9F//65pX0EYo33I4WeU4aTRS/oATg/BcH
 CP+wumdduBFRq9DrBQHWmI4Fmc8NFBEabE7Vb0fd4a/AtO3A6cmoKiFNjukI6PwFLCc8YzgiCgP
 AKrAJizSewhlc+DcxoFusaGwmkQ4QE78OSOvaE/h+KRacbEGGBfcj1HcI+lqp934G402VEXb03Q
 ECcmxvTxHaRqM4GZ8pYYsEIqnAfadyDvh/AI8VkMTcQd3egG3BHpAWeWb44WXdvWO7a7gGJlgqc
 Muty0UZEeo6oH3aYflCoA/Oep0n3fUfxNycW1AbCOMKOLsVgYiWjkm//bf2EOZarjVjgT3ma9ou
 pxnFvyU3E2dpCkbm+H/u14OdHEk9oY/KEt0QHXuIGqY9Wibq4vn/tz2y/aluHa2h0fmMqJTW64x
 yv33Su/9r4yso3zeHRw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-21_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603210055

On Fri, Mar 20, 2026 at 05:29:07PM +0100, David Heidelberg via B4 Relay wrote:
> From: Alexander Martinz <amartinz@shiftphones.com>
> 
> Audio amplifier TFA9890 is present on the board.
> 
> Signed-off-by: Alexander Martinz <amartinz@shiftphones.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
